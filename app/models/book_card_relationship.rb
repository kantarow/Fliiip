class BookCardRelationship < ApplicationRecord
  belongs_to :vocabulary_book
  belongs_to :vocabulary_card

  validates_uniqueness_of :vocabulary_card_id, scope: [:id, :vocabulary_card_id]
end
