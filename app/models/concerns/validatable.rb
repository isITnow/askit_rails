# frozen_string_literal: true

module Validatable
  extend ActiveSupport::Concern

  included do
    validates :body, presence: true, length: { minimum: 2, maximum: 255 }
  end
end