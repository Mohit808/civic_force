import 'package:civic_force/project_modules/post/controller_post_list.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class HomeRefresherClass{
  static RefreshController refreshController=RefreshController();

}

class ControllerHome extends GetxController{
  bool layoutChanged=true;


  @override
  void onInit() {
    super.onInit();
  }

  refreshData(){
    try{
      ControllerPostList controllerPostList=Get.find();
      controllerPostList.refreshData();
    }catch(e){}


  }

}