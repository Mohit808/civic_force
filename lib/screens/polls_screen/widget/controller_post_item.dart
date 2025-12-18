import 'package:get/get.dart';

import '../../../model/model_x.dart';
import '../../../network_handling/network_manager.dart';
import '../../../utils.dart';
import '../../../utils/app_urls.dart';

class ControllerPostItem extends GetxController{

  dynamic selectedRadio;
  bool loadingDelete= false;
  final Function()? onDeleteClick;
  final Function()? onVote;
  ControllerPostItem({this.onDeleteClick, this.onVote});



  postVote({pollOptionId}) async {
    try{
      var res = await NetworkManager().post(AppUrls.vote,data: {
        "poll_option_id":"$pollOptionId"
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        // list[index].setVoted=true;
        showToastSuccess(modelX.message);
        if(onVote!=null)onVote!();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      print(e);
    }
    update();
  }

  deletePoll(pollId) async {
    loadingDelete=true;
    update();
    try{
      var res=await NetworkManager().delete(AppUrls.poll,data: {
        "poll_id":"$pollId"
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        // list.removeAt(index);
        if(onDeleteClick!=null)onDeleteClick!();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
    loadingDelete=false;
    update();
  }

}