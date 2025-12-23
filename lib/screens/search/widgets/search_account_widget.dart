import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';

class SearchAccountWidget extends StatelessWidget {
  const SearchAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SmallText(text: "Accounts",fontWeight: FontWeight.w600,size: 18,),
      SizedBox(height: 24,),

      ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 5,shrinkWrap: true,itemBuilder: (itemBuilder,index){
        return Row(spacing: 24,children: [
          ImageCommon(src: "https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg",height: 50,width: 50,fit: BoxFit.cover,borderRadius: 50,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
            Row(spacing: 8,
              children: [
                SmallText(text: "Amit Yadav",fontWeight: FontWeight.w500,size: 16,),
                Icon(Icons.check_circle,color: Colors.blue,size: 16,)
              ],
            ),
            Row(spacing: 8,
              children: [
                SmallText(text: "amit.ayx.360",color: Colors.black54,),
                ContainerDecorated(color: Colors.black26,),
                SmallText(text: "56K followers",color: Colors.black54,)
              ],
            )
          ],)
        ],);
      }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
    ],);
  }
}
