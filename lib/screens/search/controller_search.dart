import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../model/city_model.dart' as cm;
import 'package:civic_force/model/tags_model.dart' as tm;
import '../../model/search_user_model.dart' as um;
import '../../model/post_model.dart' as pm;
import '../../model/trending_tags_model.dart' as trm;

class ControllerSearch extends GetxController{
  int selectedTab=0;
  TextEditingController textEditingController=TextEditingController();
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  RefreshController refreshController=RefreshController();
  List<cm.Data> listCity=[];
  List<tm.Data> listTags=[];
  List<um.Data> listAccounts=[];
  List<pm.Data> listPosts=[];
  int page=1;
  bool loadMore=false;
  trm.Data? trendingTagsModel;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchTrendingTags();
    
  }
  changeTab(index){
    selectedTab=index;
    refreshData();
  }

  fetchData(){
    if(selectedTab==0){
      // if(textEditingController.text.isNotEmpty)fetchAccountsData();
      fetchPostData();
    }
    if(selectedTab==1){
      fetchAccountsData();
    }else
    if(selectedTab==2){
      fetchTagsData();
    }else
    if(selectedTab==3){
      fetchCityData();
    }
  }

  refreshData(){
    listAccounts=[];
    listPosts=[];
    listTags=[];
    listCity=[];
    page=1;
    loadMore=false;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    if(selectedTab==0){
      if(textEditingController.text.isNotEmpty)fetchAccountsData();
      fetchPostData();
    }
    if(selectedTab==1){
      fetchAccountsData();
    }else
    if(selectedTab==2){
      fetchTagsData();
    }else
    if(selectedTab==3){
      fetchCityData();
    }
  }

  fetchTrendingTags() async {
    var res=await DataSourceCommon().fetchTrendingTags();
    trendingTagsModel=res;
    update();

  }
  fetchAccountsData() async {
    var res=await DataSourceCommon().fetchUsers(page: selectedTab==0?1:page,search: textEditingController.text);

    if(selectedTab!=0){
      if(res.length==10){
        loadMore=true;
        page++;
      }else{
        loadMore=false;
      }
    }
    listAccounts.addAll(res);
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  fetchTagsData() async {
    var res=await DataSourceCommon().fetchTags(search: textEditingController.text,page: page);
    if(res.length==10){
      loadMore=true;
      page++;
    }else{
      loadMore=false;
    }
    listTags.addAll(res);
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  fetchCityData() async {
    var res=await DataSourceCommon().fetchCity(search: textEditingController.text,page: page);
    if(res.length==10){
      loadMore=true;
      page++;
    }else{
      loadMore=false;
    }
    listCity.addAll(res);
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  fetchPostData() async {
    var res=await DataSourceCommon().fetchPosts(page: page,withMedia: true);
    if(res.length==10){
      loadMore=true;
      page++;
    }else{
      loadMore=false;
    }
    listPosts.addAll(res);
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }



}