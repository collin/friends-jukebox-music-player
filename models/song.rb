class Song < Sequel::Model(:songs)
  has_many :picks
end