# == Schema Information
#
# Table name: asks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  writer     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#  product_id :integer
#

require 'test_helper'

class AskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
