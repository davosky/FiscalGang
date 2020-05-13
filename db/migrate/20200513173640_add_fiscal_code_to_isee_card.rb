class AddFiscalCodeToIseeCard < ActiveRecord::Migration[5.2]
  def change
    add_column :isee_cards, :fiscal_code, :string
  end
end
