class VocabularyCard < ApplicationRecord
  has_many :book_card_relationships
  has_many :vocabulary_books, through: :book_card_relationships
  belongs_to :user

  validates :ja, presence: true
  validates :en, presence: true
end
