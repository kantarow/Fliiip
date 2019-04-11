class User < ApplicationRecord
  has_secure_password
  has_many :vocabulary_cards
  self.primary_key = :id_name
  validates :id_name, presence:   true,
                      uniqueness: true

  validates :name,    presence:   true

  validates :email,   presence:   true
end
