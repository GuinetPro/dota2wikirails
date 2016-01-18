json.array!(@heroe_sets) do |heroe_set|
  json.extract! heroe_set, :id, :title, :description, :active, :heroe_id, :cost
  json.url heroe_set_url(heroe_set, format: :json)
end
