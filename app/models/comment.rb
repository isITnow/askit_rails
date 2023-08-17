# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorship
  include Validatable


  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # validates :body, presence: true, length: { minimum: 2 }
end
