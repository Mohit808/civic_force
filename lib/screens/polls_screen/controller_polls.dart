import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/model/poll_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ControllerPolls extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  bool loadMore=false;
  int page=1;
  RefreshController refreshController=RefreshController();
  List listAlreadyVote=[];

  dynamic selectedRadio;

  dynamic loadingDelete;


  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  refreshData(){
    page=1;
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.poll}?page=$page");
      print(res);
      PollModel pollModel=PollModel.fromJson(res);
      list.addAll(pollModel.data??[]);
    }catch(e){
      print(e);
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  // postVote({pollOptionId,index}) async {
  //   try{
  //     var res = await NetworkManager().post(AppUrls.vote,data: {
  //       "poll_option_id":"$pollOptionId"
  //     });
  //     print(res);
  //     ModelX modelX=ModelX.fromJson(res);
  //     if(modelX.status==200){
  //       list[index].setVoted=true;
  //       showToastSuccess(modelX.message);
  //     }else{
  //       showToastError(modelX.message);
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  //   update();
  // }
  //
  // deletePoll(pollId,{index}) async {
  //   loadingDelete=index;
  //   update();
  //   try{
  //     var res=await NetworkManager().delete(AppUrls.poll,data: {
  //       "poll_id":"$pollId"
  //     });
  //     ModelX modelX=ModelX.fromJson(res);
  //     if(modelX.status==200){
  //       showToastSuccess(modelX.message);
  //       list.removeAt(index);
  //     }else{
  //       showToastError(modelX.message);
  //     }
  //   }catch(e){}
  //   loadingDelete=null;
  //   update();
  // }
}