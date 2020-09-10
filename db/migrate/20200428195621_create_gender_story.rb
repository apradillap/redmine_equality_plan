# frozen_string_literal: true

class CreateGenderStory < ActiveRecord::Migration[4.2]
  def change
    create_table :gender_stories do |t|
      t.integer :female_count, default: 0
      t.integer :male_count, default: 0
      t.date :registered_on, null: false

      t.timestamps
    end
  end
end
