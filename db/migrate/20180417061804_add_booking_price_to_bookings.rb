class AddBookingPriceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :booking_price, :integer
  end
end
