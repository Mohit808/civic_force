import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/project_modules/chat_module/video_call/controller_video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerVideoCall(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Video call",elevation: 0,),
          body: Column(children: [

            // if(controller.engine!=null)AgoraVideoView(
            //   controller: VideoViewController.remote(
            //     rtcEngine: controller.engine!,
            //     canvas: VideoCanvas(uid: controller.remoteUid),
            //     connection: RtcConnection(channelId: "xyz"),
            //   ),
            // ),

            if(controller.engine!=null)Expanded(
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: controller.engine!,
                  canvas: const VideoCanvas(uid: 0),
                ),
              ),
            )

          ],),
        );
      }
    );
  }
}
