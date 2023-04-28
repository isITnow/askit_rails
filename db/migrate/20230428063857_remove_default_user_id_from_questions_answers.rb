class RemoveDefaultUserIdFromQuestionsAnswers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :questions, :user_id, from: User.first.id, to: nil
    change_column_default :answers, :user_id, from: User.first.id, to: nil
  end
end
