class CreateVocabularyBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabulary_books do |t|
      t.string  :name
      t.integer :user_id

      t.timestamps
    end
  end
end
