class User < ApplicationRecord
  self.primary_key = :uid
  validates :uid,  presence: true,
                   uniqueness: true
  validates :name, presence:   true

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    User.find_by_uid(uid) || User.create(uid: uid, name: name, image_url: image_url)
  end
end
