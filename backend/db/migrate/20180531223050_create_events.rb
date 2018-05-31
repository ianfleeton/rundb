# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :city
      t.text :description
      t.string :organiser
      t.date :starts_on
      t.string :web
      t.string :reg

      t.timestamps
    end
    add_index :events, :starts_on
  end
end
