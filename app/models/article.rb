# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  extend FriendlyId
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :article_tags
  has_many :tags, through: :article_tags
  belongs_to :user
  validates :name, :body, presence: true
  validates :category_ids, presence: true
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
