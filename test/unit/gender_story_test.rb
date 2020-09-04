require File.expand_path('../../test_helper', __FILE__)

class GenderStoryTest < ActiveSupport::TestCase
  def test_initialize
    gender_story = GenderStory.new

    assert_equal(gender_story.female_count, 1)
    assert_equal(gender_story.male_count, 0)
  end
end
