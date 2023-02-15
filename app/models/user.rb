# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  before_save :format_username
  before_save :set_slug
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

  def format_username
    self.username = username.downcase
  end

  def set_slug
    self.slug = username.parameterize
  end

  def to_param
    slug
  end

  scope(:by_name, -> { order(:name) })
  scope(:not_admins, -> { by_name.where(admin: false) })
end
