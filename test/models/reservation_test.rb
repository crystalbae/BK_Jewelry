# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  writer     :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
