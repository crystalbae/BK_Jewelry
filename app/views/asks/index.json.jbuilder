json.array!(@asks) do |ask|
  json.extract! ask, :id, :title, :content, :writer, :model
  json.url ask_url(ask, format: :json)
end
