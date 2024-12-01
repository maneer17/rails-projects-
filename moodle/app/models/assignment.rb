class Assignment < ApplicationRecord
  belongs_to :course
  has_many :submissions, dependent: :destroy
  validates :title, length: { in: 6..30 }
  validate :deadline_date_cannot_be_in_the_past
  def deadline_date_cannot_be_in_the_past
    if deadline.present? && deadline < (Time.current+2.hours)
      errors.add(:deadline, "can't be in the past")
    end
  end

end

=begin
    elsif deadline.present? && deadline.time > Time.now
    errors.add(:deadline, "can't be in the past")
    end
=end
