class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
end
