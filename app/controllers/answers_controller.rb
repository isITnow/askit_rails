class AnswersController < ApplicationController
  before_action :set_question, only: %i[create]

  def index
    @answers = Answer.all
  end

  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)
    else
      render "questions/show", status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find params[:question_id]
  end
  
  def answer_params
    params.require(:answer).permit(:body)
  end
end