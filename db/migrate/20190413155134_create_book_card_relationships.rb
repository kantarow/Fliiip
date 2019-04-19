class CreateBookCardRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :book_card_relationships do |t|
      t.integer :vocabulary_book_id
      t.integer :vocabulary_card_id

      t.timestamps
    end
  end
end
