# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :city, null: false
      t.text :description
      t.string :organiser, null: false
      t.date :starts_on, null: false
      t.string :web, null: false
      t.string :reg

      t.timestamps
    end
    add_index :events, :starts_on
  end
end
