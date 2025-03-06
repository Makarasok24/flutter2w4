import 'package:blablacar_week4/model/ride/locations.dart';
import 'package:blablacar_week4/repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  // static const List<Location> availableLocations = fakeLocations;
  static LocationsService? _instance;
  final LocationsRepository repository;
  LocationsService._internal(this.repository) {}

  static void initialize(LocationsRepository repository) {
    _instance = LocationsService._internal(repository);
  }

  static LocationsService get instance {
    if (_instance == null) {
      throw Exception('LocationsService has not been initialized.');
    }
    return _instance!;
  }

  List<Location> getLocations() {
    return repository.getLocations();
  }

  List<Location> getLocationsFor(String text) {
    return repository
        .getLocations()
        .where(
          (location) =>
              location.name.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();
  }
}
