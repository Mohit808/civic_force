import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../../../screens/user_profile/user_profile_screen.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({super.key, });


  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,top: 8),
        child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
          Row(
            children: [
              Row(
                children: [
                  ContainerDecorated(color: Colors.black12,height: 40,width: 40,borderRadius: 30,),
                  SizedBox(width: 8,),
                  ContainerDecorated(color: Colors.black12,height: 15,width: 30,),
                  SizedBox(width: 16,),
                  ContainerDecorated(color: Colors.black12,height: 16,width: 100,),
                  SizedBox(width: 16,),
                  ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black12,),
                  SizedBox(width: 8,),
                  ContainerDecorated(color: Colors.black12,height: 15,width: 30,),
                ],
              ),
            ],
          ),

          SizedBox(height: 12,),
          ContainerDecorated(color: Colors.black12,height: 15,width: 320,),
          SizedBox(height: 4,),
          ContainerDecorated(color: Colors.black12,height: 15,width: 130,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
            child:
            GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount:2,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1), itemBuilder: (itemBuilder,indexXX){
              return ContainerDecorated(color: Colors.black12,borderRadius: 10,);
            }),
          ),




          Row(children: [

            Row(children: [
              ContainerDecorated(color: Colors.black12,height: 20,width: 20,),
              SizedBox(width: 8,),
              ContainerDecorated(color: Colors.black12,height: 15,width: 30,),
            ],),

            Spacer(),
            Row(children: [
              ContainerDecorated(color: Colors.black12,height: 20,width: 20,),
              SizedBox(width: 8,),
              ContainerDecorated(color: Colors.black12,height: 15,width: 30,),
            ],),


            Spacer(),
            ContainerDecorated(color: Colors.black12,height: 20,width: 20,),
            SizedBox(width: 8,),
            ContainerDecorated(color: Colors.black12,height: 15,width: 30,),


            Spacer(),
            ContainerDecorated(color: Colors.black12,height: 20,width: 20,),
            SizedBox(width: 8,),
            ContainerDecorated(color: Colors.black12,height: 15,width: 30,),
          ],),

          SizedBox(height: 16,),
          ContainerDecorated(color: Colors.black12,height: 15,width: 100,),

          SizedBox(height: 16,),
          ContainerDecorated(color: Colors.black12,height: 15,width: 150,),
        ],),
      ),
    );
  }
}
