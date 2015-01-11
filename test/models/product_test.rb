# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :integer
#  name        :string(255)
#  explanation :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
