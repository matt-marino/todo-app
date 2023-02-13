# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  has_many :task_ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tasks, through: :favorites, source: :task
  has_secure_password
  validates :name, presence: true
  validates :email,
    presence: true,
    format: { with: /\S+@\S+/ },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username,
    presence: true,
    format: { with: /\A[A-Z0-9]+\z/i },
    uniqueness: { case_sensitive: false }

  def gravatar_id
    Digest::MD5.hexdigest(email.downcase)
  end
end
