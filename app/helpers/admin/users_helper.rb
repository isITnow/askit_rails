# frozen_string_literal: true

module Admin
  module UsersHelper
    def user_roles
      User.roles.keys.map do |role|
        [t(role, scope: 'admin.users.roles'), role]
      end
    end
  end
end
