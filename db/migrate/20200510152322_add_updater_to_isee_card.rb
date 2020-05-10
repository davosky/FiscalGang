class AddUpdaterToIseeCard < ActiveRecord::Migration[5.2]
  def change
    add_column :isee_cards, :updater, :string
  end
end
