# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role
  has_secure_password
  include Gravtastic
  gravtastic

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true
  validates :role, presence: true
end
