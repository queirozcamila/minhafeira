class ProductPolicy < ApplicationPolicy

  # def new?
  #   user.id == Shop.find(record.shop_id).user_id
  # end
  def create?
    user.id == Shop.find(record.shop_id).user_id
    # user_is_owner_or_admin?
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
