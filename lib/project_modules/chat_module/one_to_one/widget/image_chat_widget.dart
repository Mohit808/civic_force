import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageChatWidget extends StatelessWidget {
  const ImageChatWidget({super.key, this.image});
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return ImageCommon( "$image",height: Get.width-150,width: Get.width-150,borderRadius: 12,);
  }
}
