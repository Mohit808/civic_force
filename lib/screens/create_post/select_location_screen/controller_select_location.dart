import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/screens/create_post/controller_create_post.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class ControllerSelectLocation extends GetxController{
  final Set<Marker> markers = {};
  String? selectedAddress;
  bool failedLocation=false;
  GoogleMapController? googleMapController;
  @override
  void onInit() {
    super.onInit();
  }



}