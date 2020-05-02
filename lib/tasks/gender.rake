namespace :gender do
  desc "Save in custom field gender user."
  task populate_user_gender: :environment do
    # TODO Change User.all
    User.where(type: 'User').active.each do |user|
      custom_value = user.gender_custom_field.find_or_create_by(value: user.gender)
    end
  end

  desc "Save in each date number of female and male."
  task populate_gender_stories: :environment do
    # TODO: Pending
  end
end
