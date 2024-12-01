class HomeController < ApplicationController
  before_action :redirect_based_on_role
  def index

  end
  private
  def redirect_based_on_role
    if current_teacher
      redirect_to teach_courses_path
    elsif current_student
      redirect_to stud_courses_path
    else
      redirect_to new_student_session_path
    end
  end
  end