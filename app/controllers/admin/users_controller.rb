class Admin::UsersController < ApplicationController
  before_action :require_authentication
  before_action :set_user!, only: %i[edit update destroy]
  before_action :authorize_user!
  after_action  :verify_authorized

  def index
    @pagy, @users = pagy User.order(updated_at: :desc)
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t '.success'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t('.success')
    redirect_to admin_users_path
  end
  
  
  private

  def set_user!
    @user = User.find params[:id] 
  end

  def user_params
      params.require(:user).permit(
        :email, :name, :password, :password_confirmation, :role
      )
  end

  def authorize_user!
    authorize([:admin, (@user || User)])
  end
end
