
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

class SearchTagsWidget extends StatelessWidget {
  const SearchTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.separated(itemCount: 5,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
        return Row(spacing: 16,children: [
          ContainerDecorated(borderRadius: 30,padding: 8,child: Icon(Icons.tag),),
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SmallText(text: "#Child Abuse",fontWeight: FontWeight.w600,size: 16,),
            SmallText(text: "55.8K posts",color: Colors.black54,),
          ],)
        ],);
      }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },)
    ],);
  }
}
