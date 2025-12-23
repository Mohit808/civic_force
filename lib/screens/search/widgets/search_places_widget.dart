

import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

class SearchPlacesWidget extends StatelessWidget {
  const SearchPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 5,itemBuilder: (itemBuilder,index){
        return Row(spacing: 16,children: [
          ContainerDecorated(borderRadius: 30,padding: 12,child: Icon(Icons.location_on_outlined)),
          Expanded(
            child: Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "City",color: Colors.black54,fontWeight: FontWeight.w500,),
              SmallText(text: "Rajiv chauk, new delhi, india",fontWeight: FontWeight.w600,size: 16,maxLine: 2,),
              SmallText(text: "55.8K posts",color: Colors.black54,),
            ],),
          )
        ],);
      }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },)
    ],);
  }
}
