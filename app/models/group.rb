# typed: false
# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :classifications, dependent: :destroy
  has_many :tasks, through: :classifications
end
