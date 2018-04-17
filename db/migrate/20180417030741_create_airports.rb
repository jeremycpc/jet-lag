class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :acronym
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
