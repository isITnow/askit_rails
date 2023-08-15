require 'rails_helper'

RSpec.describe UsersController, type: :controller do
      it do
      params = { user: attributes_for(:user) }

      should permit(:name, :email, :password, :password_confirmation).
      for(:create, params: params).on(:user)

      should_not permit(:last_name).
      for(:create, params: params).on(:user)
    end
end