class Submission < ApplicationRecord
  belongs_to :student
  belongs_to :assignment
  validates :student_id, uniqueness: { scope: :assignment_id}
  has_one_attached :file, dependent: :destroy
  validates :file, presence: true,allow_nil:false
  validates :title, presence: true, allow_blank:true
end
