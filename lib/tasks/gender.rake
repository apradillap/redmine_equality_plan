# frozen_string_literal: true

namespace :gender do
  desc 'Save in custom field gender user.'
  task populate_user_gender: :environment do
    User.in_company.each do |user|
      custom_value = user.gender_custom_field.find_or_create_by(value: user.gender)
    end

    User.where(status: 3).each do |user|
      custom_value = user.gender_custom_field.find_or_create_by(value: user.gender)
    end

    puts 'Populate user gender'
  end

  desc 'Clean custom field gender user.'
  task clean_user_gender: :environment do
    CustomValue.where(custom_field_id: CustomField.gender_custom_field_id).destroy_all
    puts 'Clean user gender'
  end

  desc 'Save in each date number of female and male.'
  task populate_gender_stories: :environment do
    start_date = User.first.created_on
    end_date = Date.today + 1.month

    number_of_months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)

    dates = number_of_months.times.each_with_object([]) do |count, array|
      array << [start_date.beginning_of_month + count.months,
                start_date.end_of_month + count.months]
    end

    dates.each do |month|
      puts 'Month ' + month.first.to_s[0..6]
      female_count = User.female.where('created_on < ?::date AND updated_on > ?::date', month.last, month.first).size
      male_count = User.male.where('created_on < ?::date AND updated_on > ?::date', month.last, month.first).size
      GenderStory.create(female_count: female_count,
                         male_count: male_count,
                         registered_on: month.first.to_date)
    end
    puts 'End Save in each date number of female and male'
  end

  desc 'Clean gender stories'
  task clean_gender_stories: :environment do
    GenderStory.destroy_all
    puts 'Clean gender stories'
  end

  desc 'Save in each date number of female and male dismissals.'
  task populate_gender_dismissals: :environment do
    start_date = User.first.created_on
    end_date = Date.today + 1.month

    number_of_months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)

    dates = number_of_months.times.each_with_object([]) do |count, array|
      array << [start_date.beginning_of_month + count.months,
                start_date.end_of_month + count.months]
    end

    dates.each do |month|
      puts 'Month ' + month.first.to_s[0..6]
      byebug if month.first.to_s[0..6] == "2020-08"
      female_count = User.where("users.status=3").female.where("updated_on::date >= ?::date AND updated_on::date <= ?::date", month.first.to_date, month.last.to_date).size
      male_count = User.where("users.status=3").male.where("users.updated_on::date >= ?::date AND users.updated_on::date <= ?::date", "2020-08-01".to_date, "2020-08-31".to_date).size
      GenderDismissal.create(female_count: female_count,
                             male_count: male_count,
                             dismissed_on: month.first.to_date)
    end
    puts 'End save in each date number of female and male dismissals'
  end

  desc 'Clean gender dismissals'
  task clean_gender_dismissals: :environment do
    GenderDismissal.destroy_all
    puts 'Clean gender dismissals'
  end
end
