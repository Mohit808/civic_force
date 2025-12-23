import 'package:flutter/cupertino.dart';

import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';

class SearchPostWidget extends StatelessWidget {
  const SearchPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SmallText(text: "Posts",size: 18,fontWeight: FontWeight.w600,),
      ),
      SizedBox(height: 16,),

      Column(spacing: 4,children: [
        for(var x in [1,2,3])
          Row(spacing: 4,children: [
            Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/d5/b6/87/d5b6875a66775287fd43ea26829c2df5.jpg",fit: BoxFit.cover,borderRadius: 10,))),
            Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/1200x/bc/fe/3b/bcfe3b9d5e411fa2ba0c1e4ad2a12b68.jpg",fit: BoxFit.cover,borderRadius: 10,))),
            Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/3d/a3/8e/3da38ed4d1a039039324c6decefe37e2.jpg",fit: BoxFit.cover,borderRadius: 10,))),
          ],),
      ],)
    ],);
  }
}
