import 'package:blablacar_week4/model/ride/locations.dart';

abstract class LocationsRepository {
  List<Location> getLocations();
}