# typed: false
# frozen_string_literal: true

class Task < ApplicationRecord
  before_save :set_slug
  has_many :task_ratings, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :critics, through: :ratings, source: :user
  has_many :classifications, dependent: :destroy
  has_many :groups, through: :classifications
  validates :title, :priority, :due_date, presence: true
  validates :description, length: { minimum: 25 }, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :title, presence: true, uniqueness: true

  PRIORITY = ["Low", "Medium", "High", "Needs to be done yesterday"]

  def average_stars
    task_ratings.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (average_stars / 5.0) * 100
  end

  def set_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end

  scope(:recent, -> { where("created_at <= ?", 1.week.ago).order(created_at: :desc) })
  scope(:upcoming, -> { where("due_date > ?", Time.now).order(due_date: :asc) })
  scope(:recent_results, ->(max = 5) { recent.limit(max) })
  scope(:completed, -> { where(completed: true) })
  scope(:incomplete, -> { where(completed: false) })
  scope(:all_tasks, -> { order(:title) })
end
