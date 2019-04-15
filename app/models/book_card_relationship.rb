class BookCardRelationship < ApplicationRecord
  belongs_to :vocabulary_book
  belongs_to :vocabulary_card
end
