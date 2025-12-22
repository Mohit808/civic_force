import 'package:civic_force/model/tags_model.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerAnalysisDetail extends GetxController{
  int selectedTab=0;
  String? tagName;
  List<Data> list=[];
  dynamic totalCities;
  PostStats? postStats;
  ControllerAnalysisDetail({this.tagName});

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.cityByTag}?tag=$tagName");
      print(res);
      TagsModel tagsModel=TagsModel.fromJson(res);
      totalCities=tagsModel.totalCities;
      postStats=tagsModel.postStats;
      if(tagsModel.status==200){
        list.addAll(tagsModel.data??[]);
      }else{
        showToastSuccess(tagsModel.message);
      }
    }catch(e){}
    update();
  }
}