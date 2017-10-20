json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :biography, :hometown
  json.url artist_url(artist, format: :json)
end
