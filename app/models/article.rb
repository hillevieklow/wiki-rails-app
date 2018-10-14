class Article < ApplicationRecord
  belongs_to :topic, required: false
  belongs_to :user
  has_many :favorites
end
