# frozen_string_literal: true

namespace :gender do
  desc 'Save in custom field gender user.'
  task populate_user_gender: :environment do
    # TODO: Change User.all
    User.in_company.each do |user|
      custom_value = user.gender_custom_field.find_or_create_by(value: user.gender)
    end
  end

  desc 'Save in each date number of female and male.'
  task populate_gender_stories: :environment do
    start_date = User.first.created_on
    end_date = Date.today

    number_of_months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)

    dates = number_of_months.times.each_with_object([]) do |count, array|
      array << [start_date.beginning_of_month + count.months,
                start_date.end_of_month + count.months]
    end

    dates.each do |month|
      puts 'Month ' + month.first.to_s[0..6]
      female_count = User.in_company.female.where('created_on < ?::date AND updated_on > ?::date', month.last, month.first).size
      male_count = User.in_company.male.where('created_on < ?::date AND updated_on > ?::date', month.last, month.first).size
      GenderStory.create(female_count: female_count,
                         male_count: male_count,
                         registered_on: month.first.to_date)
    end
    puts 'End Save in each date number of female and male'
  end
end
