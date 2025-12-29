import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_token_service/agora_token_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ControllerVideoCall extends GetxController{
  RtcEngine? engine;
  dynamic remoteUid;

  @override
  void onInit() {
    super.onInit();
    createAgoraToken(channelName: "xyz");
  }

  createAgoraToken({channelName}){
    final appId = '6f9e5b6a388b490f81b80f4ab6346bfa';
    final appCertificate = '30613c0b6ad0457ebe16ee3f0709615d';
    final uid = '0';
    final role = RtcRole.publisher;

    final expirationInSeconds = 3600;
    final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final expireTimestamp = currentTimestamp + expirationInSeconds;

    final token = RtcTokenBuilder.build(appId: appId, appCertificate: appCertificate, channelName: "$channelName", uid: uid, role: role, expireTimestamp: expireTimestamp,);

    initAgora(token: token,channelName: channelName);
  }

  Future<void> initAgora({token,channelName}) async {
    await [Permission.camera, Permission.microphone].request();

    engine = createAgoraRtcEngine();
    await engine!.initialize(RtcEngineContext(appId: "6f9e5b6a388b490f81b80f4ab6346bfa",));
    await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);


    engine!.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (connection, elapsed) {
        // localUserJoined = true;
        print("JOINNEDDDD Success");
        print("✅ Local user ${connection.localUid} joined channel: ${connection.channelId}");
        update();
      },
      onUserJoined: (connection, remoteUidX, elapsed) {
        remoteUid = remoteUidX;
        update();
      },
      onUserOffline: (connection, remoteUidX, reason) {
        remoteUid = null;
        // destroyAndRemove();
        Get.back();
      },
      onLocalVideoStateChanged: (source, state, reason){
        // if (state ==  ||
        //     state == RemoteVideoState.remoteVideoStateFrozen) {
        //   remoteCameraOn = false;
        // } else if (state == RemoteVideoState.remoteVideoStateDecoding) {
        //   remoteCameraOn = true;
        // }
      },
      onRemoteVideoStateChanged: (connection, remoteUid, state, reason, elapsed) {
        // if (state == RemoteVideoState.remoteVideoStateStopped ||
        //     state == RemoteVideoState.remoteVideoStateFrozen) {
        //   remoteCameraOn = false;
        // } else if (state == RemoteVideoState.remoteVideoStateDecoding) {
        //   remoteCameraOn = true;
        // }
        update();
      },
    ));

    // if(isAudioCall==null)
    await engine!.enableVideo();
    await engine!.startPreview();


    await engine!.joinChannel(token: token, channelId: channelName, uid: 0, options: const ChannelMediaOptions(),);
    update();
  }
}