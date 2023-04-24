class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:warning] = "Incorrect email and/or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you later!"
    redirect_to root_path
  end
end
