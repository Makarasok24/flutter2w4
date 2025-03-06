import 'package:blablacar_week4/model/ride/ride.dart';
import 'package:blablacar_week4/model/ride/ride_filter.dart';
import 'package:blablacar_week4/model/ride/ride_sort_type.dart';
import 'package:blablacar_week4/model/ride_pref/ride_pref.dart';

abstract class RidesRepository {
  List<Ride> getRides(
    RidePreference preference,
    RideFilter? filter,
    RideSortType? sortType,
  );
}
