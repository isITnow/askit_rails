# frozen_string_literal: true

class Answer < ApplicationRecord
  include Commentable

  default_scope { order(updated_at: :desc) }
  
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: { minimum: 5 }
end
