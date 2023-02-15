# typed: false
# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :classifications, dependent: :destroy
  has_many :tasks, through: :classifications
  before_save :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end
