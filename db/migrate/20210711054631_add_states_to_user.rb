class AddStatesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean, default: false
    add_column :users, :approved, :boolean, default: false
    add_column :users, :confirmed, :boolean, default: false
  end
end
