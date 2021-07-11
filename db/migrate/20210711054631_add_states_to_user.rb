class AddStatesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean
    add_column :users, :approved, :boolean
    add_column :users, :confirmed, :boolean
  end
end
