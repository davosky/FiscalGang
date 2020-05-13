# frozen_string_literal: true

class AddNoteToIseeCard < ActiveRecord::Migration[5.2]
  def change
    add_column :isee_cards, :note, :string
  end
end
