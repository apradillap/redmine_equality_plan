# frozen_string_literal: true

class GenderDismissal < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes 'female_count',
                  'male_count',
                  'dismissed_on'
end
