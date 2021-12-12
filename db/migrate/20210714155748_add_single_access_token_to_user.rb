class AddSingleAccessTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :single_access_token, :string, null: false
  end
end
