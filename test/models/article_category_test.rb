# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
