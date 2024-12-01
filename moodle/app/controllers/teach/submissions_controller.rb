class Teach::SubmissionsController < ApplicationController
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @submissions=@assignment.submissions.all
    @count = @submissions.count
  end


  def show
    @course=Course.find(params[:course_id])
    @assignment = @course.assignments.find(params[:assignment_id])
    @submission=@assignment.submissions.find(:id)
  end

end
