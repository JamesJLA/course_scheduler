class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments

  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
