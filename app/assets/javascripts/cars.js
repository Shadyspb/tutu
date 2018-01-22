$(document).ready(function() {
  $('.new_car').change(function() {

    var car_type = $(this).find('#car_type').val();
    var up_places = $('#car_up_places').show();
    var down_places = $('#car_down_places').show();
    var side_up_places = $('#car_side_up_places').show();
    var side_down_places = $('#car_side_down_places').show();
    var seat_places = $('#car_seat_places').show();

    if (car_type =="CoupeCar") {
      side_up_places.hide();
      $('label[for="side_up_places"]').hide();
      side_down_places.hide();
      $('label[for="side_down_places"]').hide();
      seat_places.hide();
      $('label[for="car_seat_places"]').hide();
    }
    if (car_type == 'RegularCar') {
      seat_places.hide();
      $('label[for="car_seat_places"]').hide();
    }
    if (car_type == 'LuxCar') {
      up_places.hide();
      $('label[for="car_up_places"]').hide();
      side_up_places.hide();
      $('label[for="side_up_places"]').hide();
      side_down_places.hide();
      $('label[for="side_down_places"]').hide();
      seat_places.hide();
      $('label[for="car_seat_places"]').hide();
    }
    if (car_type == 'SeatCar') {
      up_places.hide();
      $('label[for="car_up_places"]').hide();
      down_places.hide();
      $('label[for="car_down_places"]').hide();
      side_up_places.hide();
      $('label[for="car_side_up_places"]').hide();
      side_down_places.hide();
      $('label[for="car_side_down_places"]').hide();
    }
  });
});
