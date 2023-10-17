import '../configs/export_config.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData?> getCurrentLocation() async {
    if (!await _location.serviceEnabled()) {
      if (!await _location.requestService()) {
        return null;
      }
    }

    var permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return null;
      }
    }

    return await _location.getLocation();
  }
}
