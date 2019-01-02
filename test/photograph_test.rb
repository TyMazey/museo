require_relative 'test_helper'

class PhotographTest < Minitest::Test

  def setup
    @attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: 4,
      year: 1954
    }
  end

  def test_it_exsist
    photograph = Photograph.new(@attributes)

    assert_instance_of Photograph, photograph
  end

  def test_it_has_attributes
    photograph = Photograph.new(@attributes)

    assert_equal "1", photograph.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", photograph.name
    assert_equal 4, photograph.artist_id
    assert_equal 1954, photograph.year
  end
end