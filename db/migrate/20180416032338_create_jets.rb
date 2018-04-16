class CreateJets < ActiveRecord::Migration[5.1]
  def change
    create_table :jets do |t|
      t.string :name
      t.text :description
      t.boolean :has_service
      t.string :origin
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
