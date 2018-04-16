class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :booked_on
      t.date :returned_on
      t.references :user, foreign_key: true
      t.references :jet, foreign_key: true

      t.timestamps
    end
  end
end
