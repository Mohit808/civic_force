import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils.dart';
import '../size_and_type_widget.dart';
import 'controller_audio_chat.dart';

class AudioChatWidget extends StatelessWidget {
  const AudioChatWidget({super.key, this.url, required this.index, this.size, this.userId, this.disable});
  final dynamic url;
  final int index;
  final dynamic size;
  final dynamic userId;
  final bool? disable;


  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAudioChat(),
      builder: (controller) {

        Color color=userId==userInfo?.userId?Colors.white:Colors.black;
        Color colorDim=userId==userInfo?.userId?Colors.white70:Colors.black54;

        return InkWell(onTap: disable==true?null: (){
          if(controller.player!=null){
            controller.disposePlayer();
            return;
          }
          controller.setAndPlay(url);
          controller.playingIndex=index;
          controller.update();
        },child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(spacing: 16,children: [
                Stack(
                  children: [
                    Icon(controller.playingIndex==index?Icons.pause:Icons.play_arrow_rounded,size: 30,color: color,),
                    if(controller.buffering)Padding(
                      padding: const EdgeInsets.only(top: 2.0,left: 2),
                      child: SizedBox(height: 20,width: 20,child: CircularProgressIndicator(strokeWidth: 2,)),
                    )
                  ],
                ),

                Expanded(child: SizeAndTypeWidget(url: url,size: size,userId: userId,))
              ],),
              if(controller.playingIndex==index)Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: LinearProgressIndicator(
                  value: controller.makeProgressBar(),
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  minHeight: 2,
                ),
              )
            ],
          ),
        ),);
      }
    );
  }
}
