# frozen_string_literal: true

class CreateGenderCustomField < ActiveRecord::Migration[4.2]
  def self.up
    CustomField.find_or_create_by(name: 'gender',
                                  type: 'UserCustomField',
                                  field_format: 'string',
                                  default_value: 'andy')

    User.all.each { |user| user.save }
  end

  def self.down
    CustomField.where(name: 'gender').destroy
  end
end
