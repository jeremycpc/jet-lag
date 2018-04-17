class AddAvailableDatesToJet < ActiveRecord::Migration[5.1]
  def change
    add_column :jets, :start_on, :date
    add_column :jets, :end_on, :date
  end
end
