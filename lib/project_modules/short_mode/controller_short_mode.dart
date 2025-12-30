import 'package:civic_force/project_modules/post/controller_post_list.dart';
import 'package:get/get.dart';
import 'package:civic_force/model/post_model.dart';

class ControllerShortMode extends GetxController{

  List<Data> list=[];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData(){
    ControllerPostList controllerPostList=Get.find();
    list=controllerPostList.list.where((toElement)=>toElement.image!=null && toElement.image!.isNotEmpty).toList();
    update();
  }

}