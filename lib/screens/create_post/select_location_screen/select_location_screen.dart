import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/create_post/select_location_screen/controller_select_location.dart';
import 'package:civic_force/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSelectLocation(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Select Location"),
          body: Column(children: [
            Expanded(child: GoogleMap(onMapCreated: (mapController){
              controller.googleMapController=mapController;
            },markers: controller.markers,initialCameraPosition: CameraPosition(target: LatLng(28.648506, 77.204409)),
            onTap: (LatLng latLng) async {
              controller.markers.clear();
              controller.markers.add(Marker(markerId: MarkerId(latLng.toString()),position: latLng));
              controller.googleMapController!.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
              try{
                controller.selectedAddress =await LocationService().decodeLocation(latLng);
              }catch(e){
                controller.failedLocation=true;
              }
              controller.update();

              },
            )),


            if(controller.selectedAddress!=null)Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmallText(text: "${controller.selectedAddress}",textAlign: TextAlign.center,),
                )),
              ],
            ),


          ],),

          persistentFooterButtons: controller.selectedAddress==null?[]:[
            ButtonSingleAtom(widget: "Use this location",tap: (){
              Get.back(result: {
                "address":controller.selectedAddress,
                "latLng":controller.markers.first.position
              });
            },),
          ],
        );
      }
    );
  }
}
