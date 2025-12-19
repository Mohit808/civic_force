import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../model/post_model.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_manager.dart';
import '../../utils/app_urls.dart';

class ControllerPostList extends GetxController{

  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  int page=1;
  bool loadMore=false;
  RefreshController refreshController=RefreshController();

  List<Data>? listReceived;
  ControllerPostList({this.listReceived});

  @override
  void onInit() {
    super.onInit();
    if(listReceived!=null && listReceived!.isNotEmpty){
      list.addAll(listReceived!);
    }else{
      apiResponse=ApiResponse(status: Status.LOADING);
      update();
      fetchData();
    }
  }

  refreshData(){
    page=1;
    loadMore=false;
    list.clear();
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.post}?page=$page");
      PostModel postModel=PostModel.fromJson(res);
      list.addAll(postModel.data!);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      if(postModel.data!.length<10){
        loadMore=false;
      }else{
        loadMore=true;
        page++;
      }
    }catch(e){
      print(e);
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
    refreshController.refreshCompleted();
    refreshController.loadComplete();

  }
}