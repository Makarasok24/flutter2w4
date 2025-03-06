import 'package:blablacar_week4/model/ride/locations.dart';
import 'package:blablacar_week4/model/ride/ride.dart';
import 'package:blablacar_week4/model/ride/ride_filter.dart';
import 'package:blablacar_week4/model/ride_pref/ride_pref.dart';
import 'package:blablacar_week4/model/user/user.dart';
import 'package:blablacar_week4/repository/rides_repository.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _rides = [];

  MockRidesRepository() {
    User kannika = User(firstName: "Kannika");
    User chaylim = User(firstName: "Chaylim");
    User mengtech = User(firstName: "Mengtech");
    User limhao = User(firstName: "Limhao");
    User sovanda = User(firstName: "Sovanda");

    Location battambang = Location(
      name: "Battambang",
      country: Country.cambodia,
    );
    Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

    Ride ride_1 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 5, minute: 30),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 7, minute: 00),
      driver: kannika,
      availableSeats: 2,
      pricePerSeat: 15,
    );

    Ride ride_2 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 20, minute: 00),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 00),
      driver: chaylim,
      availableSeats: 0,
      pricePerSeat: 15,
    );

    Ride ride_3 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 5, minute: 00),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 8, minute: 00),
      driver: mengtech,
      availableSeats: 1,
      pricePerSeat: 15,
    );

    Ride ride_4 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 20, minute: 00),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 22, minute: 00),
      driver: limhao,
      availableSeats: 2,
      pricePerSeat: 15,
    );

    Ride ride_5 = Ride(
      departureLocation: battambang,
      departureDate: DateTime.now().copyWith(hour: 5, minute: 00),
      arrivalLocation: siemReap,
      arrivalDateTime: DateTime.now().copyWith(hour: 8, minute: 00),
      driver: sovanda,
      availableSeats: 1,
      pricePerSeat: 15,
    );

    _rides.addAll([ride_1, ride_2, ride_3, ride_4, ride_5]);
  }

  @override
  List<Ride> getRides(RidePreference preference, RideFilter? filter) {
    return _rides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              (filter != null && filter.acceptPets ? ride.acceptPets : true) &&
              ride.availableSeats > 0,
        )
        .toList();
  }
}
