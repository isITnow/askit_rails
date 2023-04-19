class QuestionsController < ApplicationController
  before_action :get_question, only: %i[edit update show destory]

  def show
    @answer = @question.answers.build
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def edit
  end

  def update
    if @question.update question_params
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def get_question
    @question = Question.find params[:id]
  end
end
