import 'package:flutter/material.dart';

import '../../../../common_widget/container_decorated.dart';
import '../../../../common_widget/text_common.dart';
import '../../../../utils.dart';

class SizeAndTypeWidget extends StatelessWidget {
  const SizeAndTypeWidget({super.key, this.userId, this.url, this.size});
  final dynamic userId;
  final dynamic url;
  final dynamic size;


  @override
  Widget build(BuildContext context) {
    Color color=userId==userInfo?.userId?Colors.white:Colors.black;
    Color colorDim=userId==userInfo?.userId?Colors.white70:Colors.black54;

    return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
      SmallText(text: "$url".split("/").last,fontWeight: FontWeight.w500,size: 15,maxLine: 1,color:color,),
      Row(spacing: 8,
        children: [
          if(size!=null)SmallText(text: "$size kb",color:colorDim),
          if(size!=null)ContainerDecorated(color:colorDim,height: 6,width: 6,),
          SmallText(text: "$url".split("/").last.split(".").last,color: colorDim),
        ],
      )
    ],);
  }
}
