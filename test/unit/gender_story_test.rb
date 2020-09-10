# frozen_string_literal: true

require File.expand_path('../test_helper', __dir__)

class GenderStoryTest < ActiveSupport::TestCase
  fixtures :all

  def test_initialize
    gender_story = GenderStory.new

    assert_equal(gender_story.female_count, 0)
    assert_equal(gender_story.male_count, 0)
  end

  def test_assign_gender_to_female_user
    u = User.find(1)

    assert_equal(u.gender, 'andy')
  end
end
