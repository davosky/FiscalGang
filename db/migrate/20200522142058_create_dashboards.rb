class CreateDashboards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.date :date
      t.text :content
      t.references :user, foreign_key: true
      t.references :message_priority, foreign_key: true

      t.timestamps
    end
  end
end
