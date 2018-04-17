class AddAirportReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :jets, :airport, index: true
  end
end
