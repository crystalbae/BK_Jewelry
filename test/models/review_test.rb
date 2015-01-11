# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  writer     :string(255)
#  email      :string(255)
#  product_id :integer
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
