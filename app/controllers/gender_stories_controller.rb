class GenderStoriesController < ApplicationController
  before_action :authorize_global, :define_months

  def index
    @groups = Group.all
  end

  def manage
    user = User.find(params['id'])
    user.gender_custom_field.first.update_column(:value, params['gender'])
    @users = User.andy.all
    @male_users = User.male
    @female_users = User.female
    @male_users_count = GenderStory.all.map(&:male_count)
    @female_users_count = GenderStory.all.map(&:female_count)
  end

  def define_months
    start_date = User.first.created_on
    end_date = Date.today

    number_of_months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)

    dates = number_of_months.times.each_with_object([]) do |count, array|
      array << [start_date.beginning_of_month + count.months,
                start_date.end_of_month + count.months]
    end

    @months = dates.map{|m| m.first.to_s[0..6]}   
  end

end
