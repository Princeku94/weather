import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;



  Future<void> getCurrentLocation() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
     
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);

      // });
    } catch (e) {
      print(e);
    }
  }

  ///////////////////////

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // do stuff
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // do stuff
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // do stuff

      return false;
    }
    return true;
  }
}
