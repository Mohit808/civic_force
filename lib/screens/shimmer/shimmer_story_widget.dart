import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerStoryWidget extends StatelessWidget {
  const ShimmerStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(child: Row(children: [
      for(var x in [1,23,213,12,312,3])
        SizedBox(width: 100,child: Stack(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10),child: Container(decoration: BoxDecoration(color: Color(0xFF151515)),height: 120,width: 90,)),
            Padding(
              padding: const EdgeInsets.only(top: 4.0,left: 4),
              child: SizedBox(height: 24,width: 24,child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Container(color: Color(0xFF333232),)),),
            )
          ],
        ))
    ],),);
  }
}
