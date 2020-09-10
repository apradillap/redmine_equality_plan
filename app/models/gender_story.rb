# frozen_string_literal: true

class GenderStory < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes 'female_count',
                  'male_count',
                  'registered_on'
end
