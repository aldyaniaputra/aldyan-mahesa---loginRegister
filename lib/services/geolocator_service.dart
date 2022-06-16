import 'package:geolocator/geolocator.dart';
import 'package:no_name/models/user_location.dart';

class GeolocatorService {
  final Geolocator _geolocator = Geolocator();

  Future<UserLocation> getCurrentLocation() async {
    try {
      var adressLine = '';
      final Position position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
      if(position.mocked){
        adressLine = '#FakeLocation';
      }

      UserLocation userLocation = UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        addressLine: adressLine,
      );
      return userLocation;
    } catch (e){
      return null;
    }
  }
}