class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :favorites
end
