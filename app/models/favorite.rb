# typed: false
# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :task
  belongs_to :user
end
