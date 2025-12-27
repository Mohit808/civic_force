import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class ControllerAudioChat extends GetxController{
  AudioPlayer? player ;
  dynamic totalDuration;
  bool buffering=false;
  dynamic currentPosition;
  int? playingIndex;



  @override
  void onInit() {
    super.onInit();
  }


  initiateAudio() async {
    player!.playerStateStream.listen((state) {
      final processingState = state.processingState;

      if (processingState == ProcessingState.idle) {
        print('Player is idle — not yet loaded.');
      } else if (processingState == ProcessingState.loading) {
        buffering=true;
        update();
      } else if (processingState == ProcessingState.buffering) {
        buffering=true;
        update();
      } else if (processingState == ProcessingState.ready) {
        buffering=false;
        update();
      } else if (processingState == ProcessingState.completed) {
        buffering=false;
        playingIndex=null;
        update();
        disposePlayer();
      }
    });

    player!.positionStream.listen((position) {
      print('Current position: $position');
      currentPosition=position;
      update();
    });
  }

  setAndPlay(url) async {
    player=AudioPlayer();
    final duration = await player!.setUrl('$url');
    totalDuration=duration;
    player!.play();
    initiateAudio();
  }

  disposePlayer(){
    if(player!=null)player!.dispose();
    player=null;
    playingIndex=null;
    update();
  }

  makeProgressBar(){
    double progress = 0;
    if (totalDuration != null && totalDuration!.inMilliseconds > 0) {
      progress = currentPosition.inMilliseconds / totalDuration!.inMilliseconds;
    }
    return progress;
  }

  @override
  void dispose() {
    if(player!=null){
      player!.dispose();
      player=null;
    }
    super.dispose();
  }

  @override
  void onClose() {
    if(player!=null){
      player!.dispose();
      player=null;
    }
    super.onClose();
  }




}