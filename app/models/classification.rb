# typed: false
# frozen_string_literal: true

class Classification < ApplicationRecord
  belongs_to :task
  belongs_to :group
end
