class ProductPolicy < ApplicationPolicy

  def create?
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private
  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
