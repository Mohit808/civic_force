import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../common_widget/container_decorated.dart';

class ShimmerUserWidget extends StatelessWidget {
  const ShimmerUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(child: GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 12,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 8,mainAxisSpacing: 8,crossAxisCount: 3), itemBuilder: (itemBuilder,index){
      return ContainerDecorated(color: Color(0xFF151515),);
    }));
  }
}
