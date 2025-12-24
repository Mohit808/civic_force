
import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/city_model.dart';
import '../../model/tags_model.dart' as tm;


class ControllerAddCity extends GetxController{
  List<Data> list=[];
  List<tm.Data> listTags=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  RefreshController refreshController=RefreshController();
  bool loadMore=false;
  int page=1;
  int selectedTab=0;
  @override
  void onInit() {
    super.onInit();
    fetchTagData();
  }

  refreshData(){
    list=[];
    listTags=[];
    page=1;
    loadMore=false;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    if(selectedTab==0){
      fetchTagData();
    }else{
      fetchData();
    }
  }
  fetchData() async {
      // var res=await NetworkManager().get("${AppUrls.city}?page=$page&no_image=true");
      // CityModel cityModel=CityModel.fromJson(res);
      // list.addAll(cityModel.data??[]);

    var res=await DataSourceCommon().fetchCity(page: page,noImage: true);
    list.addAll(res);
    if(res.length==10){
      page++;
      loadMore=true;
    }else{
      loadMore=false;
    }

    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  fetchTagData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.tags}?page=$page&no_image=true");
      tm.TagsModel tagsModel=tm.TagsModel.fromJson(res);
      listTags.addAll(tagsModel.data??[]);
      if(tagsModel.data?.length==10){
        page++;
        loadMore=true;
      }else{
        loadMore=false;
      }
    }catch(e){}
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }
}