import 'package:geocoding/geocoding.dart' as gd;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../screens/create_post/controller_create_post.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getCurrentLocation() async {
    // Check if service is enabled
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    // Check permission
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return null;
    }

    // Get location
    LocationData locationData = await location.getLocation();
    return locationData;
  }

  decodeLocation(LatLng latLng) async {
    print("a");

    try{
      ControllerCreatePost controllerCreatePost=Get.find();
      controllerCreatePost.selectedAddress=null;
      controllerCreatePost.latLng=null;
      controllerCreatePost.selectedCity=null;
      controllerCreatePost.selectedState=null;
      controllerCreatePost.selectedCountry=null;

      List<gd.Placemark> placeMarks = await gd.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placeMarks.isNotEmpty) {
        final place = placeMarks.first;
        controllerCreatePost.selectedAddress = "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        controllerCreatePost.latLng=latLng;
        controllerCreatePost.selectedCity=place.subAdministrativeArea;
        controllerCreatePost.selectedState=place.administrativeArea;
        controllerCreatePost.selectedCountry=place.country;

        print(place.locality);
        print(place.subLocality);
        print(place.administrativeArea);
        print(place.subAdministrativeArea);
        print(place.name);
        print(place.street);
        print(place.thoroughfare);
        print("XXXXXXX");
      }
      controllerCreatePost.update();
      return controllerCreatePost.selectedAddress;
    }catch(e){
      print(e);
      throw Exception();
    }
  }
}
