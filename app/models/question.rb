# frozen_string_literal: true

class Question < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def formatted_edited_at
    updated_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
