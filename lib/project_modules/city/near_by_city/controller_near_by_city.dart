import 'package:civic_force/model/city_model.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerNearByCity extends GetxController{
  List<Data> list=[];
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    var res=await NetworkManager().get(AppUrls.city);
    CityModel cityModel=CityModel.fromJson(res);
    if(cityModel.status==200){
      list.addAll(cityModel.data??[]);
    }
  }
}