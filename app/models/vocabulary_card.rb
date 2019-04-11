class VocabularyCard < ApplicationRecord
  belongs_to :user
  validates :ja, presence: true
  validates :en, presence: true
end
