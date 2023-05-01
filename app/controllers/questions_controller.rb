# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def show
    @answer = @question.answers.build
    @pagy, @answers = pagy(@question.answers.includes(:user))
  end

  def destroy
    @question.destroy
    flash[:success] = t('.success')
    redirect_to questions_path
  end

  def edit; end

  def update
    if @question.update question_params
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @pagy, @questions = pagy(Question.includes(:user))
  end

  def new
    @question = Question.new
  end

  def create
    # variant 1
    # @question = Question.new question_params
    # @question.user_id = current_user.id
      # variant 2
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
