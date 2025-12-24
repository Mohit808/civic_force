import 'package:civic_force/model/tag_post_by_city_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

String myCity="Prayagraj Division";
class ControllerCityMain extends GetxController{
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
      var res=await NetworkManager().get("${AppUrls.tagPostByCity}?city=$myCity");
      print(res);
      TagPostByCityModel tagPostByCityModel=TagPostByCityModel.fromJson(res);
      cityDetails=tagPostByCityModel.data?.cityDetails;
      list.addAll(tagPostByCityModel.data?.tags??[]);
    }catch(e){
      print(e);
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }
}