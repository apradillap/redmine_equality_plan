# frozen_string_literal: true

class CreateGenderDismissals < ActiveRecord::Migration[4.2]
  def change
    create_table :gender_dismissals do |t|
      t.integer :female_count, default: 0
      t.integer :male_count, default: 0
      t.date :dismissed_on, null: false

      t.timestamps
    end
  end
end
