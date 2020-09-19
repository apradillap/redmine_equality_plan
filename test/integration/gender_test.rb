require File.expand_path('../../test_helper', __FILE__)

class GenderTest < Redmine::IntegrationTest
  fixtures :all

  def test_show_plan
    log_user("admin", "admin")
    get "/equality_plans"
    assert_response :success
  end
end
