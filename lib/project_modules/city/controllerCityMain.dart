import 'package:civic_force/model/tag_by_city_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerCityMain extends GetxController{
  String myCity="Prayagraj Division";
  List<Tags> list=[];
  CityDetails? cityDetails;
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.tagByCity}?city=$myCity");
      print(res);
      TagByCityModel tagByCityModel=TagByCityModel.fromJson(res);
      cityDetails=tagByCityModel.data?.cityDetails;
      list.addAll(tagByCityModel.data?.tags??[]);
    }catch(e){
      print(e);
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }
}