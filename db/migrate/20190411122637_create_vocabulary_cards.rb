class CreateVocabularyCards < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabulary_cards do |t|
      t.string :ja
      t.string :en
      t.string :user_id

      t.timestamps
    end
  end
end
