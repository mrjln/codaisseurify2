json.array!(@artist.songs) do |song|
  json.extract! song,
  :id,
  :titel,
  :year,
  :album,
  :created_at,
  :updated_at
end
