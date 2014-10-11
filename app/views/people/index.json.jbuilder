json.array!(@people) do |person|
  json.extract! person, :id, :name, :lastname, :firstname, :gender, :age, :cabin, :role
  json.url person_url(person, format: :json)
end
