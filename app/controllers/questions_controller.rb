# frozen_string_literal: true

class QuestionsController < ApplicationController
  # include QuestionsAnswers
  before_action :require_authentication, except: %i[index show]
  before_action :set_question!, only: %i[show destroy edit update]
  before_action :fetch_tags, only: %i[new edit]
  before_action :authorize_question!
  before_action :authorize_question!
  before_action :verify_authorized

  def show
    # load_question_answers
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
    @pagy, @questions = pagy Question.all_by_tags(params[:tag_ids])
    # @tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids]
    # @pagy, @questions = pagy Question.all_by_tags(@tags)
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
    params.require(:question).permit(:title, :body, tag_ids: [])
  end

  def set_question!
    @question = Question.find params[:id]
  end

  def fetch_tags
    @tags = Tag.all
  end

  def authorize_question!
    authorize(@question || Question)
  end
end
