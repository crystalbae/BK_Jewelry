json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :title, :content, :writer, :email
  json.url reservation_url(reservation, format: :json)
end
