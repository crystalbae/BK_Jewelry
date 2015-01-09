json.array!(@products) do |product|
  json.extract! product, :id, :category, :name, :explanation, :image
  json.url product_url(product, format: :json)
end
