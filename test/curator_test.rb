require_relative 'test_helper'

class CuratorTest < Minitest::Test

  def setup
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
  end

  def test_it_exsist
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_starts_with_no_artist_or_photographs
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_it_can_create_photos
    curator = Curator.new

    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)

    assert_instance_of Photograph, curator.photographs.first
  end

  def test_it_can_create_artist
    curator = Curator.new

    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)

    assert_instance_of Artist, curator.artists.first
  end


end
