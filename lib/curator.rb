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
end
