class ChangeStatusToCarts < ActiveRecord::Migration[6.0]
  def change
    change_column :carts, :status, :string, default: "open"
  end
end
