class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id_name, primary_key: true
      t.string :name
      t.string :email
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
