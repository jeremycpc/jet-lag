class AddBookingSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :seats, :integer
  end
end
