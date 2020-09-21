require File.expand_path('../../test_helper', __FILE__)

class EqualityPlansControllerTest < Redmine::ControllerTest
  fixtures :all

  include Redmine::I18n

  def setup
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  def test_index
    get :index
    assert_response :success

    assert_select "h1", l(:label_gender_statistics)

    assert_select "h2", l(:label_gender_disaggregated)
    assert_select "h2", l(:label_monthly_additions)
    assert_select "h2", l(:label_monthly_dismissals)
    assert_select "h2", l(:label_group_statistics)
    assert_select "h2", l(:label_age_and_gender)
  end
end
