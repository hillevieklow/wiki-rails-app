class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :favorites, through: :articles

  before_save { |user| user.email = user.email.downcase }
end
