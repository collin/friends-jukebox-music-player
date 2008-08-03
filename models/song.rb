class Song < Sequel::Model(:songs)
  has_many :picks

  def local_file
    @local_file||= Pathname.new("#{APP_ROOT + "public"}#{url}")
  end

  def id3
    @id3||= ID3Lib::Tag.new(local_file)
  end
end