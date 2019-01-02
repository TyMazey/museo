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
    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }

    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
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

    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
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

  def test_it_can_find_artist_by_id
    curator = Curator.new
    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)

    assert_equal curator.artists.first, curator.find_artist_by_id("1")
  end

  def test_it_can_find_photo_by_id
    curator = Curator.new
    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)

    assert_equal curator.photographs.last, curator.find_photograph_by_id("2")
  end

  def test_find_photographs_by_artist
    curator = Curator.new
    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)
    curator.add_photograph(@photo_3)
    curator.add_photograph(@photo_4)
    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)
    curator.add_artist(@artist_3)
    diane_arbus = curator.find_artist_by_id("3")

    assert_equal [curator.photographs[2], curator.photographs[-1]], curator.find_photographs_by_artist(diane_arbus)
  end

  def test_it_can_find_all_artist_with_multiple_photos
    curator = Curator.new
    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)
    curator.add_photograph(@photo_3)
    curator.add_photograph(@photo_4)
    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)
    curator.add_artist(@artist_3)

    assert_equal [curator.find_artist_by_id("3")], curator.artists_with_multiple_photographs
  end

  def test_it_can_find_photos_by_counrty
    curator = Curator.new
    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)
    curator.add_photograph(@photo_3)
    curator.add_photograph(@photo_4)
    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)
    curator.add_artist(@artist_3)

    assert_equal [curator.photographs[1],curator.photographs[2],curator.photographs[3]], curator.photographs_taken_by_artist_from("United States")
    assert_equal [], curator.photographs_taken_by_artist_from("Argentina")
  end
end
