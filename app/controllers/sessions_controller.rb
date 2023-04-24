class SessionsController < ApplicationController
  def new
  end

  def create
    renred plain: params.to_yaml
  end

  def destroy
  end
end
