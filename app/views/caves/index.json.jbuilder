json.array!(@caves) do |cafe|
  json.extract! cafe, :id, :name, :inventory_no, :length, :depth, :denivelation, :genesis, :inventory_id, :x_1992, :y_1992, :lat, :lon
  json.url cafe_url(cafe, format: :json)
end
