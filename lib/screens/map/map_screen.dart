import 'dart:async';

import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/screens/map/controller_map.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/bottom_sheet_media.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMap(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",height: 0,),
          body: Column(children: [

            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(28.611999, 77.178675),
                      zoom: 5.4746,
                    ),
                    onMapCreated: (GoogleMapController mapController) {
                      controller.controllerGoogleMap.complete(mapController);
                    },
                      // circles: controller.circles,
                    markers: controller.markers,
                  ),
                  // Image.network("https://www.thestatesman.com/wp-content/uploads/2020/04/googl_ED.jpg",height: Get.height-70,fit: BoxFit.cover,),


                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(spacing: 8,children: [
                            Expanded(child: TextFieldCommon(prefixIcon: Icon(Icons.search,color: Colors.white,),borderRadius: 30,hintText: "Search anything",fillColor: AppColors.primary,textStyleHint: TextStyle(color: Colors.white,fontSize: 12),))
                            // ContainerDecorated(colorBorder: Colors.blue.withOpacity(0.5),padding: 8,elevation: 10,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.arrow_back_ios_new_rounded,size: 24,color: Colors.white,)),
                            // Expanded(child: Material(elevation: 10,borderRadius: BorderRadius.circular(30),child: TextFieldCommon(borderRadius: 30,hintText: "Search anything",fillColor: AppColors.primary,textStyleHint: TextStyle(color: Colors.white,fontSize: 12),))),
                            // ContainerDecorated(padding: 8,elevation: 10,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.search,size: 24,color: Colors.white,)),

                          ],),
                          SingleChildScrollView(scrollDirection: Axis.horizontal,
                            child: Row(spacing: 8,children: [
                              for(var x in [{"icon":Icons.border_all_rounded,"text":"All"},{"icon":Icons.remove_road_rounded,"text":"Road"},{"icon":Icons.sanitizer,"text":"Litter"},{"icon":Icons.electric_bolt,"text":"Electricity"}])
                                ContainerDecorated(colorBorder: Colors.grey.shade300,borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 6),elevation: 1,color: x['text']!="All"?AppColors.primary: Colors.red,child: Row(spacing: 8,
                                  children: [
                                    Icon(x['icon'] as IconData,size: 16,color:Colors.white,),
                                    SmallText(text: "${x['text']}",fontWeight: FontWeight.w600,color:Colors.white,),
                                  ],
                                ))
                            ],),
                          ),


                          Spacer(),
                          Row(
                            children: [
                              Container(decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(10)),padding: EdgeInsets.all(12),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,children: [
                                  Row(spacing: 8,
                                    children: [
                                      Icon(Icons.remove_road,color: Colors.white,size: 16,),
                                      SmallText(text: "Road",color: Colors.white,)
                                    ],
                                  ),

                                  Row(spacing: 8,
                                    children: [
                                      Icon(Icons.water_drop,color: Colors.blue,size: 16,),
                                      SmallText(text: "Water",color: Colors.blue,)
                                    ],
                                  ),

                                  Row(spacing: 8,
                                    children: [
                                      Icon(Icons.dirty_lens,color: Colors.white,size: 16,),
                                      SmallText(text: "Litter",color: Colors.white,)
                                    ],
                                  ),

                                  Row(spacing: 8,
                                    children: [
                                      Icon(Icons.electric_bolt,color: Colors.white,size: 16,),
                                      SmallText(text: "Electricity",color: Colors.white,)
                                    ],
                                  ),
                                ],),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.camera_alt),onPressed: (){
            showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
              return BottomSheetMedia();
            });
          }),
        );
      }
    );
  }
}
