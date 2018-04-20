
const basePrice = document.getElementById('base-price');
const seats = document.getElementById('booking_seats');
let totalPrice = document.getElementById('total-price');


seats.addEventListener('input', function(e) {
  totalPrice.innerText = Number(basePrice.innerText) * Number(e.target.value)
});
