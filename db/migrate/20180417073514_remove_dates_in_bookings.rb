class RemoveDatesInBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :booked_on
    remove_column :bookings, :returned_on
  end
end
