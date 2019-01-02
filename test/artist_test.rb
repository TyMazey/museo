require_relative 'test_helper'

class ArtistTest < Minitest::Test

  def setup
    @attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
  end

  def test_it_exsist
    artist = Artist.new(@attributes)

    assert_instance_of Artist, artist
  end

  def test_it_has_attributes
    artist = Artist.new(@attributes)

    assert_equal "1", artist.id
    assert_equal "Ansel Adams", artist.name
    assert_equal "1902", artist.born
    assert_equal "1984", artist.died
    assert_equal "United States", artist.country
  end
end
