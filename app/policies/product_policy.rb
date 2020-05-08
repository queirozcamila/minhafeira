class ProductPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private
  def user_is_owner_or_admin?
    Shop.find(record.shop_id).user_id == user.id || user.admin
  end
end
