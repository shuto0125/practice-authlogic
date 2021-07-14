class AddActiveToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :perishable_token, :string
  end
end
