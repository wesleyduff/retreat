json.array!(@cabins) do |cabin|
  json.extract! cabin, :id, :name, :available, :gender, :description, :max, :people_count
  json.url cabin_url(cabin, format: :json)
end
