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

class Ask < ActiveRecord::Base
  belongs_to :product
end
