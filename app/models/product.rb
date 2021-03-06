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
#  price       :integer
#  like        :integer          default(0)
#

class Product < ActiveRecord::Base
  enum category: [ :wedding, :propose, :ring, :necklace, :earring, :bracelet ]
  mount_uploader :image, AvatarUploader
  has_many :asks
  has_many :reviews
end
