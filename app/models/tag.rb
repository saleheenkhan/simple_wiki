class Tag < ApplicationRecord
  extend FriendlyId
  has_many :article_tags
  has_many :articles, through: :article_tags

  validates :name, presence: true, uniqueness: true
  friendly_id :name, use: :slugged
end
