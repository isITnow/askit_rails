# frozen_string_literal: true

# needs to be fixed before use

# module QuestionsAnswers
#   extend ActiveSupport::Concern

#   included do
#     def load_question_answers(do_render: false)
#       @answer ||= @question.answers.build
#       @pagy, @answers = pagy @question.answers.includes(:user)
#       render('questions/show') if do_render
#     end
#   end
# end