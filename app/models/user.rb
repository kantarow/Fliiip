class User < ApplicationRecord
  has_secure_password
  self.primary_key = :id_name
  validates :name, presence: true
  validates :email, presence: true
end
