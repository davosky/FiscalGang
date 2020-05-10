# frozen_string_literal: true

class CreateIseeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :isee_cards do |t|
      t.integer :code
      t.date :date
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.references :use_type, foreign_key: true
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.date :completion_date
      t.boolean :completed

      t.timestamps
    end
  end
end
