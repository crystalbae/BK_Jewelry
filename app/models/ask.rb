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
#  password   :string(255)
#

class Ask < ActiveRecord::Base
  belongs_to :product
  acts_as_commentable
end
