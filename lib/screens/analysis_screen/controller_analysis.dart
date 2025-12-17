import 'package:civic_force/model/analysis_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ControllerAnalysis extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  RefreshController refreshController=RefreshController();
  bool loadMore=false;
  int page=1;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  refreshData(){
    loadMore=false;
    page=1;
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.analysis}?page=$page");
      AnalysisModel analysisModel=AnalysisModel.fromJson(res);
      list.addAll(analysisModel.data??[]);
      if(analysisModel.data!.length<10){
        loadMore=false;
      }else{
        loadMore=true;
        page++;
      }
    }catch(e){}
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }
}