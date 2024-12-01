# app/controllers/teach/courses_controller.rb
class Teach::CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :teacher_teaches_course, only: %i[ show edit update destroy ]

  # GET /teach/courses or /teach/courses.json
  def index
      @courses = current_teacher.courses.all
  end
  def new
    @course = current_teacher.courses.new
  end

  # POST /teach/courses or /teach/courses.json
  def create
    @teacher = current_teacher
    @course = Course.new(course_params)
    @teacher.courses.append(@course)
    respond_to do |format|
      if @course.save
        format.html { redirect_to teach_course_path(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teach/courses/1 or /teach/courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to teach_course_path(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teach/courses/1 or /teach/courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to teach_courses_path, status: :see_other, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :description,:avatar)
  end
  def teacher_teaches_course
    unless @course.teacher_id == current_teacher.id
      redirect_to teach_courses_path, notice: "You are not authorized to edit this course."
    end
  end
end
