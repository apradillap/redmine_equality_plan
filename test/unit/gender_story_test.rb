require File.expand_path('../../test_helper', __FILE__)

class GenderStoryTest < ActiveSupport::TestCase
  def test_initialize
    gender_story = GenderStory.new

    assert_equal(gender_story.female_count, 0)
    assert_equal(gender_story.male_count, 0)
  end

  def test_assign_gender_to_female_user
    u = User.new(:firstname => "Maria", :lastname => "user")
    u.login = "create_email_address_os"
    u.mail = "osdefaultemail@somenet.foo"
    assert u.save

    assert_equal(u.gender, 'female')
  end

  def test_assign_gender_to_male_user
    u = User.new(:firstname => "Michael", :lastname => "user")
    u.login = "create_email_address_os"
    u.mail = "osdefaultemail@somenet.foo"
    assert u.save

    assert_equal(u.gender, 'male')
  end
end
