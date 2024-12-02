# app/controllers/teach/courses_controller.rb
class Stud::CoursesController < ApplicationController
  before_action :set_course, only: %i[ show ]

  # GET /teach/courses or /teach/courses.json
  def index
      @courses = current_student.courses.all
  end
  def progress_bar
    @total= 0.0
    @submitted =0.0
    courses = current_student.courses
    courses.each do |course|
      course.assignments.each do |assignment|
        if current_student.submissions.exists?(assignment_id: assignment.id)
          @submitted+=1
        end
        @total+=1
      end
    end
    begin
      @progress = ((@submitted/@total) *100).round
    rescue FloatDomainError
      @progress = 0
    end
  end
  def upcoming_assignments
    @assignments =[]
    courses = current_student.courses
    courses.each do |course|
      course.assignments.each do |assignment|
        if !current_student.submissions.exists?(assignment_id: assignment.id) &&
          assignment.deadline > Time.current
          @assignments << assignment
        end
      end
    end
  end
  def show

  end
  def select
    @student = current_student
    all_courses = Course.all
    student_courses = @student.courses
    @courses = []
    all_courses.each do |course|
      unless student_courses.include?(course)
        @courses.append(course)
      end
    end
  end
  def enroll
    @course = Course.find(params[:course_id])
    current_student.courses << (@course)
    respond_to do |format|
        format.html { redirect_to select_stud_courses_path, notice: "you were successfully enrolled " }
      end
  end
  def unenroll
    @course = Course.find(params[:course_id])
    current_student.courses.delete(@course)
    respond_to do |format|
      format.html { redirect_to stud_courses_path, notice: "you were unenrolled from this course ." }
    end
  end
  # PATCH/PUT /teach/courses/1 or /teach/courses/1.json
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:student).permit(:course_ids[])
  end
end
