# frozen_string_literal: true

class Question < ApplicationRecord
  include Authorship
  include Commentable
  include Validatable

  has_many :answers, dependent: :destroy
  belongs_to :user
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :title, presence: true, length: { minimum: 2 }
  # validates :body, presence: true, length: { minimum: 2 }

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def formatted_edited_at
    updated_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  # scope :all_by_tags, -> (tag_ids) do
  #   questions = includes(:user, :question_tags, :tags)
  #   questions = questions.joins(:tags).where(tags: tag_ids) if tag_ids
  #   questions.order(updated_at: :desc)
  # end

  scope :all_by_tags, lambda { |tags|
    questions = includes(:user)

    questions = if tags
                  questions.joins(:tags).where(tags:).preload(:tags)
                else
                  questions.includes(:question_tags, :tags)
                end

    questions.order(created_at: :desc)
  }
end
