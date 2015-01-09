class Product < ActiveRecord::Base
  enum category: [ :wedding, :propose, :ring, :necklace, :earring, :bracelet ]
  mount_uploader :image, AvatarUploader
end
