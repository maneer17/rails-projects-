class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # Update the association to specify the correct class_name



end
