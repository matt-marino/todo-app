# typed: false
# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :task_ratings, dependent: :destroy
  validates :title, :priority, :due_date, presence: true
  validates :description, length: { minimum: 25 }, presence: true
  validates :completed, inclusion: { in: [true, false] }

  PRIORITY = ["Low", "Medium", "High", "Needs to be done yesterday"]

  def average_stars
    task_ratings.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (average_stars / 5.0) * 100
  end

  # example of a custom method
  # def flop?
  #   total_gross.blank? || total_gross < 100
  # end
end
