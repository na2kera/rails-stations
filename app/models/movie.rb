class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :schedules
end
