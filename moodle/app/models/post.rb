class Post < ApplicationRecord
  belongs_to :course
  scope :x_course_posts, ->(course ) { where('course_id = ? ', course)}
end
