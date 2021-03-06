Photo.destroy_all
Artist.destroy_all
Song.destroy_all

#seed some Artists
artist_1 = Artist.create!(
  name: "Melody Gardot",
  biography: "Melody Gardot(born February 2, 1985) is an American jazz singer whose career began
  after being injured in a bicycle accident. She has been influenced by such blues and jazz artists
  as Judy Garland, Janis Joplin, Miles Davis, Duke Ellington, Stan Getz and George Gershwin as well
  as Latin music artists such as Caetano Veloso. She has been nominated for a Grammy Award.",
  hometown: "Philadelphia",
  photos: [])

artist_2 = Artist.create!(
  name: "Florence and the Machine",
  biography: "Florence and the Machine (stylised as Florence + the Machine) are an English indie rock band
  that formed in London in 2007, consisting of lead singer Florence Welch, keyboardist Isabella Summers, and
   a collaboration of other artists. The band's music is renowned for its dramatic and eccentric
   production and also Welch's powerful vocal performances.",
   hometown: "London",
   photos: [])

artist_3 = Artist.create!(
 name: "Bob Marley",
 biography: "Robert Nesta Marley, OM (6 February 1945 – 11 May 1981) was a Jamaican
 singer-songwriter, musician, guitarist and a musical and cultural icon who
  achieved international fame and acclaim",
 hometown: "TrenchTown, Kingston Jamaica",
photos: [])

artist_4 = Artist.create!(
 name: "Robbie Williams",
 biography: "Robert Peter Williams (born 13 February 1974)
 is an English singer, songwriter and actor. He was a member of the pop
 group Take That from 1990 to 1995 and again from 2009 to 2012. He has also
 had commercial success as a solo artist.",
 hometown: "Staffordshire",
photos: [])

#seed some songs
song_1 = Song.create(
  titel: "Baby I'm a fool",
  year: 2009,
  album:"My One and Only Thrill",
  artist: artist_1,
)
song_2 = Song.create(
  titel: "If the Stars were mine",
  year: 2009,
  album:"My One and Only Thrill",
  artist: artist_1,
)
song_3 = Song.create(
  titel: "Dog days are over",
  year: 2009,
  album:"Lungs",
  artist: artist_2,
)
song_4 = Song.create(
  titel: "Kiss with a fist",
  year: 2009,
  album:"Lungs",
  artist: artist_2,
)

song_5= Song.create(
  titel: "Buffalo Soldier",
  year: 1983,
  album:"Confrontation",
  artist: artist_3,
)
song_6= Song.create(
  titel: "No Woman No Cry",
  year: 1983,
  album:"Confrontation",
  artist: artist_3,
)
song_7= Song.create(
  titel: "Rock DJ",
  year: 2000,
  album:"Sing when your winning",
  artist: artist_4,
)
song_8= Song.create(
  titel: "Kids",
  year: 2000,
  album:"Sing when your winning",
  artist: artist_4,
)

# Photos

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508070396/Melody_Gardot_brex48.jpg", artist: artist_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508070395/florencemachine_gbp35g.jpg", artist: artist_2)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508070395/Bob_Marley_ndegeb.jpg", artist: artist_3)
photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/du3yzngfr/image/upload/v1508070394/Robbie_Williams_c6jsbl.jpg", artist: artist_4)
