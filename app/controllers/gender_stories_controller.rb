class GenderStoriesController < ApplicationController
  before_action :authorize_global

  def index
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
