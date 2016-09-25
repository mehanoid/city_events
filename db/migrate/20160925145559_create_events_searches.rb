class CreateEventsSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :events_searches do |t|
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
