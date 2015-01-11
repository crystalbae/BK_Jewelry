# == Schema Information
#
# Table name: asks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  writer     :string(255)
#  model      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#

class Ask < ActiveRecord::Base
  belongs_to :product
end
