class Stud::AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show]
  before_action :set_course
  before_action :check_enrollment


  # GET /assignments or /assignments.json
  def index
    @assignments = @course.assignments.all
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @student = current_student
    @assignment = Assignment.find(params[:id])
    @is_submitted = @student.submissions.exists?(assignment_id: @assignment.id)
    @is_deadline_finished = @assignment.deadline < Time.now
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @course = Course.find(params[:course_id ])
    @assignment = @course.assignments.find(params[:id])
  end
  private
  def set_course
    @course = Course.find(params[:course_id ])
  end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:title, :content, :deadline, :course_id)
    end
  def check_enrollment
    unless current_student.courses.include?(@course)
      redirect_to select_stud_courses_path, notice: "enroll in this course to get access to its materials !"
    end
  end
end
