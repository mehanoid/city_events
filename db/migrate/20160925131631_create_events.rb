class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :address
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
