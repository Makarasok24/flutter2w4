import 'package:blablacar_week4/model/ride/ride.dart';
import 'package:blablacar_week4/model/ride/ride_filter.dart';
import 'package:blablacar_week4/model/ride/ride_sort_type.dart';
import 'package:blablacar_week4/model/ride_pref/ride_pref.dart';
import 'package:blablacar_week4/repository/rides_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static RidesService? _instance;
  final RidesRepository repository;
  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    _instance = RidesService._internal(repository);
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception('RidesService is not initialized');
    }

    return _instance!;
  }

  List<Ride> getRidesFor(
    RidePreference preference,
    RideFilter? filter,
    RideSortType? sortType,
  ) {
    return repository.getRides(preference, filter, sortType);
  }

  // static List<Ride> availableRides = fakeRides;

  // ///
  // ///  Return the relevant rides, given the passenger preferences
  // ///
  // static List<Ride> getRidesFor(RidePreference preferences) {

  //   // For now, just a test
  //   return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  // }
}
