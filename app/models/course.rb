class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments

  validates :name, :code, :credits, :semester, presence: true
  validates :code, uniqueness: true
  validates :credits, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }

  scope :official, -> { where(custom: false) }
  scope :custom, -> { where(custom: true) }
end
