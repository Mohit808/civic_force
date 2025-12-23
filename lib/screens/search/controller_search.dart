import 'package:civic_force/network_handling/network_manager.dart';
import 'package:get/get.dart';

class ControllerSearch extends GetxController{
  int selectedTab=0;
  @override
  void onInit() {
    super.onInit();
  }
  changeTab(index){
    selectedTab=index;
    update();
  }
  fetchData(){
    NetworkManager().get("endPoint");
  }
}