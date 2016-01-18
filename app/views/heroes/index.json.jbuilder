json.array!(@heroes) do |hero|
  json.extract! hero, :id, :name, :description, :image, :video
  json.url hero_url(hero, format: :json)
end
