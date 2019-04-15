class VocabularyBook < ApplicationRecord
  has_many :book_card_relationships
  has_many :vocabulary_cards, through: :book_card_relationships
  belongs_to :user
end
