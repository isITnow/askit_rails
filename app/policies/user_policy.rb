# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record == user
  end

  def destroy?
    false
  end

  def index?
    false
  end

  def show?
    true
  end
end
