class Teach::AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show edit update destroy ]
  before_action :set_course
  before_action :teacher_teaches_course

  # GET /assignments or /assignments.json
  def index
    @assignments = @course.assignments.all

  end

  # GET /assignments/1 or /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = @course.assignments.build
  end


  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = @course.assignments.build(assignment_params)
    #redirect_to article_path(@article)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to teach_course_assignments_path, notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to [:teach, @course,@assignment], notice: "Assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy!

    respond_to do |format|
      format.html { redirect_to teach_course_assignments_path, status: :see_other, notice: "Assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
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
  def teacher_teaches_course
    unless @course.teacher_id == current_teacher.id
      redirect_to teach_courses_path, notice: "You are not authorized to edit this course."
    end
  end
end
