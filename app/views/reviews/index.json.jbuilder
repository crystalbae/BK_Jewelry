json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :content, :writer, :email, :product_id, :image
  json.url review_url(review, format: :json)
end
