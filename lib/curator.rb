class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(attributes)
    @photographs.push(Photograph.new(attributes))
  end

  def add_artist(attributes)
    @artists.push(Artist.new(attributes))
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      find_photographs_by_artist(artist).count > 1
    end
  end

  def photographs_taken_by_artist_from(country)
    artists = @artists.find_all do |artist|
      artist.country == country
    end
    photos = artists.map do |artist|
      find_photographs_by_artist(artist)
    end
    photos.flatten
  end

end
