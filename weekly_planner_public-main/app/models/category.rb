class Category < ApplicationRecord
  has_many :tasks

  validates_uniqueness_of :nickname
end
