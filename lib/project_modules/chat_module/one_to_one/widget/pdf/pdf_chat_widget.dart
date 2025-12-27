import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/widget/size_and_type_widget.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_pdf_chat.dart';

class PdfChatWidget extends StatelessWidget {
  const PdfChatWidget({super.key, this.url, this.index, this.size, this.userId, this.disable});
  final dynamic url;
  final dynamic index;
  final dynamic size;
  final dynamic userId;
  final bool? disable;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPdfChat(),
      builder: (controller) {
      Color color=userId==userInfo?.userId?Colors.white:Colors.black;
      Color colorDim=userId==userInfo?.userId?Colors.white70:Colors.black54;
        return InkWell(onTap: disable==true?null: (){
          controller.loadingIndex=index;
          controller.update();
          controller.downloadAndOpenFile(url, "$url".split("/").last);
        },child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(spacing: 16,children: [
            controller.loadingIndex==index?SizedBox(height: 30,width: 30,child: CircularProgressIndicator(strokeWidth: 1,)):Icon(Icons.picture_as_pdf_outlined,size: 30,color: color,),
            Expanded(child: SizeAndTypeWidget(url: url,size: size,userId: userId,))
          ],),
        ),);
      }
    );
  }
}
