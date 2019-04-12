class AddColumnsToUsersToRegisterWithTwitter < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_url,   :string
    add_column :users, :uid, :string
    remove_column :users, :id_name
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
  end
end
