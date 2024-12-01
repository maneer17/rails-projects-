class Stud::SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show]
  before_action :set_student, only: %i[new show ]
  before_action :set_assignment, only: %i[new show  ]
  before_action :set_course, only: %i[new show  ]
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @submissions=@assignment.submissions.where(student_id: current_student.id)
  end


  def show
    @course=Course.find(params[:course_id])
    @assignment = @course.assignments.find(params[:assignment_id])
    @submission=@assignment.submissions.where(student_id: current_student.id)
  end

  # GET /submissions/new
  def new
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.find(params[:assignment_id])
    @submission = @assignment.submissions.build
  end


  # POST /submissions or /submissions.json
  def create
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.find(params[:assignment_id])
    @submission = @assignment.submissions.build(submission_params)
    @submission.student_id = current_student.id

    respond_to do |format|
      if @submission.save
        format.html { redirect_to stud_course_assignment_submission_path(@course, @assignment, @submission), notice: "Submission was successfully created." }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /submissions/1 or /submissions/1.json

  # DELETE /submissions/1 or /submissions/1.json
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = current_student.submissions.find_by(assignment_id: params[:assignment_id])
  end

  def set_student
    @student=current_student
  end
  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end
  def set_course
    @course=Course.find(params[:course_id])
  end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.require(:submission).permit(:title,:file)
    end


end
