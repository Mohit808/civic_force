import 'package:civic_force/model/search_user_model.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';


class ControllerMutualContact extends GetxController{
  List<Data> list=[];
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppUrls.getMutualFromContacts);
      SearchUserModel searchUserModel=SearchUserModel.fromJson(res);
      list.addAll(searchUserModel.data??[]);
    }catch(e){}
    update();
  }
}