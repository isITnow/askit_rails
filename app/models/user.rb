# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true
end
