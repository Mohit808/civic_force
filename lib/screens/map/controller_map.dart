import 'dart:async';
import 'dart:ui' as ui;

import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/model/tags_model.dart' as tm;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/map_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils/app_images.dart';
import '../../utils/app_urls.dart';

class ControllerMap extends GetxController{
  bool showSearch=false;
  List<Clusters> list=[];
  List<tm.Data> listTags=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);

  Completer<GoogleMapController> controllerGoogleMap = Completer<GoogleMapController>();
  late BitmapDescriptor customIcon;
  double zoom=15;

  double? minLat;
  double? maxLat;
  double? minLng;
  double? maxLng;

  String? selectedTag;


  Set<Circle> circles = {
    // Circle(
    //   circleId: CircleId("1"),
    //   center: LatLng(28.611999, 77.178675),
    //   radius: 500000,
    //   strokeWidth: 2,
    //   strokeColor: Colors.blue,
    //   fillColor: Colors.blue.withOpacity(0.3),
    // ),
    // Circle(
    //   circleId: CircleId("2"),
    //   center: LatLng(16.995449, 77.778253),
    //   radius: 500000,
    //   strokeWidth: 2,
    //   strokeColor: Colors.red,
    //   fillColor: Colors.red.withOpacity(0.3),
    // ),
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


  Future<void> getVisibleCorners() async {
    final GoogleMapController mapController = await controllerGoogleMap.future;

    final LatLngBounds bounds = await mapController.getVisibleRegion();

    // Southwest (bottom-left)
    LatLng southWest = bounds.southwest;

    // Northeast (top-right)
    LatLng northEast = bounds.northeast;

    minLat = southWest.latitude;
    maxLat = northEast.latitude;
    minLng = southWest.longitude;
    maxLng = northEast.longitude;

    // Other two corners
    LatLng northWest = LatLng(northEast.latitude, southWest.longitude);
    LatLng southEast = LatLng(southWest.latitude, northEast.longitude);

    debugPrint("NW: $northWest"); //minLat
    debugPrint("NE: $northEast"); // maxLat
    debugPrint("SW: $southWest"); // minLng
    debugPrint("SE: $southEast"); // maxLng

    fetchData();
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
      print(zoom);
      // list.clear();
      var res=await NetworkManager().get("${AppUrls.getMapData}?min_lat=${minLat??28.4041}&max_lat=${maxLat??28.7742}&min_lng=${minLng??76.9101}&max_lng=${maxLng??77.4210}&zoom=${zoom.toInt()}&tags=${selectedTag??""}");
      // print(res);

      ModelX modelX=ModelX.fromJson(res);
      if( modelX.data !=null && modelX.data['zoom']!=null && modelX.data['zoom'] > 15 ){
        for(var x in modelX.data['markers']??[]){
          // await loadMarker(Clusters.fromJson(x),x['latitude'],x['longitude']);

          BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(40, 40)), AppImages.garbageBag,
          );
          customIcon=icon;

          markers.add(
            Marker(
                markerId: MarkerId("${x['id']}"),
                position: LatLng(x['latitude'], x['longitude']),
                icon: customIcon,
                // infoWindow: InfoWindow(title: "Reported Issue", snippet: "Road damaged"),
                onTap: (){
                  _onMarkerTapped("${x.markers?.first.id}",x);
                }
            ),
          );

        }
        update();
        return;
      }


      MapModel mapModel=MapModel.fromJson(res);
      // list.addAll(mapModel.data!.clusters??[]);
      // list.addAll((mapModel.data?.clusters ?? []).where((c) => !list.any((e) => e.markers?.first.id == c.markers?.first.id)));
      list..removeWhere((e) => (mapModel.data?.clusters ?? []).any((c) => c.markers?.first.id == e.markers?.first.id))..addAll(mapModel.data?.clusters ?? []);

      print("XYZZZZZZ ${mapModel.data!.clusters?.length}");
      print("LISTTT ${list.length}");
      apiResponse=ApiResponse(status: Status.COMPLETED);

      circles.clear();
      for(var x in list) {
        print("qwertyuiop");
        // print(x.markers?.first.tagList?.first.color);
        circles.add(Circle(circleId: CircleId("${x.markers?.first.id}",),center: LatLng(double.parse("${x.latitude??0}"),double.parse("${x.longitude??0}") ),fillColor:
        // Colors.red,
        // Colors.red.withOpacity(getOpacity(x.count?.toInt()??0)),
        hexToColor(x.markers==null?"#bf3480": x.markers?.first.tagList==null || x.markers!.first.tagList!.isEmpty?"#bf3480":x.markers?.first.tagList?.first.color??"#bf3480").withOpacity(getOpacity(x.count?.toInt()??0)),
            strokeWidth: 1,strokeColor: Colors.red,radius: double.parse("${x.radius??0}")));


        // loadMarker(x,x.latitude,x.longitude);

        for(var y in x.markers!){
          loadMarker(y, y.latitude, y.longitude);
        }


      }
    }catch(e){
      print("ERRRRRRRRPRRRRRR");
      print(e);
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }

  double getOpacity(int count) {
    if(zoom>15) return 0.1;
    if (count >= 100) return 0.8;
    if (count >= 50) return 0.7;
    if (count >= 20) return 0.5;
    return 0.3;
  }

  Color getClusterColor(int count) {
    if (count >= 100) return Colors.red.withOpacity(0.8);
    if (count >= 50) return Colors.orange.withOpacity(0.6);
    if (count >= 20) return Colors.yellow.withOpacity(0.5);
    return Colors.green.withOpacity(0.4);
  }

  Future<BitmapDescriptor> getResizedMarkerIcon(
      String assetPath,
      int width,
      ) async {
    final ByteData data = await rootBundle.load(assetPath);
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? bytes =
    await fi.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  Future<void> loadMarker(Markers x,lat,lng) async {

    var tagXimage;
    // if(x.tags!=null && "${x.tags}".isNotEmpty){
    //   var tagX="${x.tags}".split(",")[0];
    //   if(tagX=="litre"){
    //     tagXimage=AppImages.trash;
    //   }else if(tagX=="Water"){
    //     tagXimage=AppImages.drop;
    //   }else{
    //     tagXimage=AppImages.trash;
    //   }
    // }
    //  BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
    //   ImageConfiguration(size: Size(40,40)),
    //   tagXimage??AppImages.garbageBag,
    // );
    BitmapDescriptor icon = await getResizedMarkerIcon(
      AppImages.garbageBag,
      zoom>15?40: zoom>10?20:1,
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

  void _onMarkerTapped(String markerId,data) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(spacing: 16, children: [
                  InkWell(onTap: (){
                    Get.back();
                  },child: Icon(Icons.close)),
                  Text("Reported Issue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              // Text("${x.text}"),
              SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(child: ImageCommon(src: "${x.image}")),
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



Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');

  if (hex.length == 6) {
    hex = 'FF$hex'; // add full opacity
  }

  return Color(int.parse(hex, radix: 16));
}