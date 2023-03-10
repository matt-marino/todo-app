# typed: false
# frozen_string_literal: true

class TaskRating < ApplicationRecord
  belongs_to :task
  belongs_to :user
  accepts_nested_attributes_for :task
  STARS = [1, 2, 3, 4, 5]
  validates :comment, length: { minimum: 5 }
  validates :stars, inclusion: { in: STARS, message: "must be between 1 and 5" }, presence: true

  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
