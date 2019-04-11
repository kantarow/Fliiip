class User < ApplicationRecord
  has_secure_password
  self.primary_key = :id_name
  validates :id_name, presence:   true,
                      uniqueness: true

  validates :name,    presence:   true

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(id_name: uid) do |user|
      user.id_name = uid
      user.name = name
      user.image_url = image_url
    end
  end
end
