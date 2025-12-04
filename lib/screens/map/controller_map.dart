import 'dart:async';

import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/model/tags_model.dart' as tm;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/post_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils/app_images.dart';
import '../../utils/app_urls.dart';

class ControllerMap extends GetxController{
  bool showSearch=false;
  List<Data> list=[];
  List<tm.Data> listTags=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);

  Completer<GoogleMapController> controllerGoogleMap = Completer<GoogleMapController>();
  late BitmapDescriptor customIcon;


  final Set<Circle> circles = {
    Circle(
      circleId: CircleId("1"),
      center: LatLng(28.611999, 77.178675),
      radius: 500000,
      strokeWidth: 2,
      strokeColor: Colors.blue,
      fillColor: Colors.blue.withOpacity(0.3),
    ),
    Circle(
      circleId: CircleId("2"),
      center: LatLng(16.995449, 77.778253),
      radius: 500000,
      strokeWidth: 2,
      strokeColor: Colors.red,
      fillColor: Colors.red.withOpacity(0.3),
    ),
  };

  Set<Marker> markers = {
    // Marker(icon: ,markerId: MarkerId("1"),position: LatLng(16.995449, 77.778253)),
  };

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchTags();
  }

  
  fetchTags() async {
    try{
      var res=await NetworkManager().get(AppUrls.tags);
      tm.TagsModel tagsModel=tm.TagsModel.fromJson(res);
      listTags.addAll(tagsModel.data??[]);
    }catch(e){}
    update();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get(AppUrls.post);
      PostModel postModel=PostModel.fromJson(res);
      list.addAll(postModel.data!);
      apiResponse=ApiResponse(status: Status.COMPLETED);

      for(var x in list) {
        loadMarker(x,x.latitude,x.longitude);
      }
      print(res);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }

  Future<void> loadMarker(Data x,lat,lng) async {

    var tagXimage;
    if(x.tags!=null && "${x.tags}".isNotEmpty){
      var tagX="${x.tags}".split(",")[0];
      if(tagX=="litre"){
        tagXimage=AppImages.trash;
      }else if(tagX=="Water"){
        tagXimage=AppImages.drop;
      }else{
        tagXimage=AppImages.trash;
      }
    }
    final BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(40, 40)),
      tagXimage??AppImages.garbageBag,
    );
    customIcon = icon;

    markers.add(
      Marker(
        markerId: MarkerId("${x.id}"),
        position: LatLng(lat, lng),
        icon: customIcon,
        // infoWindow: InfoWindow(title: "Reported Issue", snippet: "Road damaged"),
        onTap: (){
          _onMarkerTapped("${x.id}",x);
        }
      ),
    );

  }

  void _onMarkerTapped(String markerId,Data x) {
    // Show custom bottom sheet or dialog
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(spacing: 16,
                children: [
                  InkWell(onTap: (){
                    Get.back();
                  },child: Icon(Icons.close)),
                  Text("Reported Issue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                ],
              ),
              SizedBox(height: 8),
              Text("${x.text}"),
              SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ImageCommon(src: "${x.image}")),
                ],
              ),
              // ElevatedButton(onPressed: () {}, child: Text("Close")),
            ],
          ),
        );
      },
    );
  }

}