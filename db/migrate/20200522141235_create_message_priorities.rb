# frozen_string_literal: true

class CreateMessagePriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :message_priorities do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
