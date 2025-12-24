import 'package:civic_force/data_source/data_source_common.dart';
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
  String? city;
  String? tags;
  String? userId;
  dynamic my;
  dynamic saved;
  dynamic top;
  ControllerPostList({this.listReceived,this.city,this.tags,this.userId,this.my,this.saved,this.top});

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

  refreshData() async {
    page=1;
    loadMore=false;
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }

  fetchData() async {
    try{
      // var res=await NetworkManager().get("${AppUrls.post}?page=$page&city=${city??""}&tags=${tags??""}&user_id=${userId??""}&my=${my??""}&saved=${saved??""}");
      // PostModel postModel=PostModel.fromJson(res);

      var res = await DataSourceCommon().fetchPosts(page: page,city: city,tags: tags,userId: userId,my: my,saved: saved,top:top);
      if(res.length==10){
        loadMore=true;
        page++;
      }else{
        loadMore=false;
      }
      list.addAll(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);

    }catch(e){
      print(e);
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
    refreshController.refreshCompleted();
    refreshController.loadComplete();

  }
}