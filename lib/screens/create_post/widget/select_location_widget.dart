import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/text_common.dart';

class SelectLocationWidget extends StatelessWidget {
  const SelectLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
        SizedBox(height: 8,),
        Align(alignment: AlignmentGeometry.center,child: SmallText(text: "Select Location",fontWeight: FontWeight.w600,size: 15,)),
        SizedBox(height: 24,),
        SmallText(text: "Locate me",fontWeight: FontWeight.w600,size: 14,),
        SizedBox(height: 4,),
        SmallText(text: "Fetch my current location",fontWeight: FontWeight.w500,color: Colors.grey,),
        SizedBox(height: 16,),
        ContainerDecorated(padding: 8,color: Color(0xFF1C331C),
          child: Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,children: [
            Icon(Icons.my_location_outlined,size: 16,color: Colors.white,),
            SmallText(text: "Get current location",color: Colors.white,fontWeight: FontWeight.w600,)
          ],),
        ),

        SizedBox(height: 24,),
        Divider(),
        SizedBox(height: 24,),

        SmallText(text: "Locate on map",fontWeight: FontWeight.w600,size: 15),
        SizedBox(height: 4,),
        SmallText(text: "Select specific location from map",fontWeight: FontWeight.w500,color: Colors.grey,),
        SizedBox(height: 16,),


        ContainerDecorated(padding: 8,color: Color(0xFF343F8A),
          child: Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,children: [
            Icon(Icons.location_on_outlined,size: 14,color: Colors.white,),
            SmallText(text: "Select from map",color: Colors.white,fontWeight: FontWeight.w600,)
          ],),
        ),
        SizedBox(height: 16,)

      ],),
    );
  }
}
