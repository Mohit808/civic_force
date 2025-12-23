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
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/68/3b/50/683b50b794d06988e57e6b8a3a63bd1e.jpg",fit: BoxFit.cover,borderRadius: 10,))),
        Expanded(child: AspectRatio(aspectRatio: 1, child: ImageCommon(src: "https://i.pinimg.com/736x/9d/2a/6e/9d2a6e386f606e7f8198fc87e4af5c44.jpg",fit: BoxFit.cover,borderRadius: 10,))),
      ],),
    ],);
  }
}
