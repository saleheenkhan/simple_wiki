# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  extend FriendlyId
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, uniqueness: true
  friendly_id :name, use: :slugged
end
