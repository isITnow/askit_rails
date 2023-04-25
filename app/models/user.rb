class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true
end
