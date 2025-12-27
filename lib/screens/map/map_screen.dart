import 'dart:async';

import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/controller_dashboard.dart';
import 'package:civic_force/screens/map/controller_map.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/bottom_sheet_media.dart';
import '../analysis_screen/analysis2_screen.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  // String _modernDarkMapStyle = '''
// [
//   {"elementType": "geometry","stylers":[{"color": "#0f1c2c"}]},
//   {"elementType": "labels.text.fill","stylers":[{"color": "#d0e0f0"}]},
//   {"elementType": "labels.text.stroke","stylers":[{"color": "#0f1c2c"}]},
//
//   {"featureType": "administrative","elementType": "geometry","stylers":[{"color": "#1b2a43"}]},
//   {"featureType": "administrative.country","elementType": "labels.text.fill","stylers":[{"color": "#a0c0e0"}]},
//
//   {"featureType": "landscape","elementType": "geometry","stylers":[{"color": "#0f1c2c"}]},
//   {"featureType": "poi","elementType": "geometry","stylers":[{"color": "#1b2a43"}]},
//   {"featureType": "poi.park","elementType": "geometry","stylers":[{"color": "#123744"}]},
//
//   {"featureType": "road","elementType": "geometry","stylers":[{"color": "#1f3b5c"}]},
//   {"featureType": "road","elementType": "geometry.stroke","stylers":[{"color": "#123144"}]},
//   {"featureType": "road.highway","elementType": "geometry","stylers":[{"color": "#28506a"}]},
//   {"featureType": "road.highway","elementType": "geometry.stroke","stylers":[{"color": "#122839"}]},
//
//   {"featureType": "transit","elementType": "geometry","stylers":[{"color": "#1b2a43"}]},
//
//   {"featureType": "water","elementType": "geometry","stylers":[{"color": "#041f3d"}]},
//   {"featureType": "water","elementType": "labels.text.fill","stylers":[{"color": "#7aa7c4"}]}
// ]
// ''';


  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMap(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async{
              return changeDashboardTab();
            },
            child: Scaffold(
              appBar: AppBarCommon(title: "",height: 0,),
              body: Column(children: [

                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        // style: _modernDarkMapStyle,
                        mapType: MapType.normal,
                        buildingsEnabled: true,
                        tiltGesturesEnabled: true,
                        fortyFiveDegreeImageryEnabled: true,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(28.611999, 77.178675),
                          zoom: controller.zoom,
                        ),
                        onCameraMove: (CameraPosition position) {
                          controller.zoom = position.zoom;
                          // debugPrint("Current Zoom: ${controller.zoom}");
                        },

                        // (Optional) Called when user stops moving the map
                        onCameraIdle: () {
                          debugPrint("Final Zoom: ${controller.zoom}");
                          controller.getVisibleCorners();
                        },

                        onMapCreated: (GoogleMapController mapController) {
                          controller.controllerGoogleMap.complete(mapController);
                        },
                        circles: controller.circles,
                        markers: controller.markers,
                      ),
                      // Image.network("https://www.thestatesman.com/wp-content/uploads/2020/04/googl_ED.jpg",height: Get.height-70,),


                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(controller.showSearch)Row(spacing: 8,children: [
                              Expanded(child: TextFieldCommon(isDense: true,suffixIcon: InkWell(onTap: (){
                                controller.showSearch=false;
                                controller.update();
                              },child: Icon(Icons.close,color: Colors.white,)),prefixIcon: Icon(Icons.search,color: Colors.white,),borderRadius: 30,hintText: "Search anything",fillColor: AppColors.primary,))
                              // ContainerDecorated(colorBorder: Colors.blue.withOpacity(0.5),padding: 8,elevation: 10,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.arrow_back_ios_new_rounded,size: 24,color: Colors.white,)),
                              // Expanded(child: Material(elevation: 10,borderRadius: BorderRadius.circular(30),child: TextFieldCommon(borderRadius: 30,hintText: "Search anything",fillColor: AppColors.primary,textStyleHint: TextStyle(color: Colors.white,fontSize: 12),))),
                              // ContainerDecorated(padding: 8,elevation: 10,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.search,size: 24,color: Colors.white,)),

                            ],),
                            Row(spacing: 8,
                              children: [
                                if(!controller.showSearch)ContainerDecorated(onTap: (){
                                  controller.showSearch=true;
                                  controller.update();
                                },color: AppColors.primary,borderRadius: 40,child: Row(spacing: 4,
                                  children: [
                                    ContainerDecorated(borderRadius: 40,padding: 2,child: Icon(Icons.search,size: 16,)),
                                    SmallText(text: "Search",color: Colors.white,size: 11,),
                                    SizedBox(width: 8,)
                                  ],
                                )),
                                Expanded(
                                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                    child: Row(spacing: 8,children: [
                                      for(var x in controller.listTags)
                                        InkWell(onTap: (){
                                          controller.selectedTag=x.name;
                                          controller.list.clear();
                                          controller.circles.clear();
                                          controller.update();
                                          controller.fetchData();
                                        },
                                          child: Container(decoration: BoxDecoration(color: x.name==controller.selectedTag?AppColors.primary:Colors.transparent,border: Border.all(color: AppColors.primary),borderRadius: BorderRadius.circular(30)),padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: Row(spacing: 8,
                                            children: [
                                              // Icon(x['icon'] as IconData,size: 16,color:Colors.white,),
                                              SmallText(text: "${x.name}",fontWeight: FontWeight.w600,color: x.name==controller.selectedTag?Colors.white: AppColors.primary,),
                                            ],
                                          )),
                                        ),
                                    ],),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                      // Row(
                      //   children: [
                      //     Container(decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(10)),padding: EdgeInsets.all(12),
                      //       child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,children: [
                      //         Row(spacing: 8,
                      //           children: [
                      //             Icon(Icons.remove_road,color: Colors.white,size: 16,),
                      //             SmallText(text: "Road",color: Colors.white,)
                      //           ],
                      //         ),
                      //
                      //         Row(spacing: 8,
                      //           children: [
                      //             Icon(Icons.water_drop,color: Colors.blue,size: 16,),
                      //             SmallText(text: "Water",color: Colors.blue,)
                      //           ],
                      //         ),
                      //
                      //         Row(spacing: 8,
                      //           children: [
                      //             Icon(Icons.dirty_lens,color: Colors.white,size: 16,),
                      //             SmallText(text: "Litter",color: Colors.white,)
                      //           ],
                      //         ),
                      //
                      //         Row(spacing: 8,
                      //           children: [
                      //             Icon(Icons.electric_bolt,color: Colors.white,size: 16,),
                      //             SmallText(text: "Electricity",color: Colors.white,)
                      //           ],
                      //         ),
                      //       ],),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],),
              floatingActionButton: FloatingActionButton(backgroundColor: Colors.transparent,elevation: 1,child: Icon(Icons.camera_alt,color: Colors.white,),onPressed: (){
                showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                  return BottomSheetMedia();
                });
              }),
            ),
          );
        }
    );
  }
}
