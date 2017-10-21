json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :biography, :hometown
  json.url artist_url(artist, format: :json)
end

json.array!(@artist.songs) do |song|
  json.extract! song,
  :id,
  :titel,
  :year,
  :album,
  :created_at,
  :updated_at
end
