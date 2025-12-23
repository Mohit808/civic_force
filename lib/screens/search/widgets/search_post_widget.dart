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

      Row(spacing: 4,children: [
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/d5/b6/87/d5b6875a66775287fd43ea26829c2df5.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/1200x/bc/fe/3b/bcfe3b9d5e411fa2ba0c1e4ad2a12b68.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/3d/a3/8e/3da38ed4d1a039039324c6decefe37e2.jpg",fit: BoxFit.cover,borderRadius: 10,))),
      ],),
      SizedBox(height: 4,),
      Row(spacing: 4,children: [
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/20/28/6b/20286b770de5ff3c45b7b780ef3d73e2.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/83/58/31/8358315d79589ff6878c8e0f77438637.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/cd/69/11/cd6911fa9a9dc092471d4cdd6ac351e2.jpg",fit: BoxFit.cover,borderRadius: 10,))),
      ],),
      SizedBox(height: 4,),
      Row(spacing: 4,children: [
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/57/03/65/57036571121985567755018353e7c015.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/91/07/fa/9107faefe69c909cbadbc45e5eb5c3ad.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/c7/5f/b8/c75fb8bf10f1663393702273270935fd.jpg",fit: BoxFit.cover,borderRadius: 10,))),
      ],),
    ],);
  }
}
