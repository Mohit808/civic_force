import 'package:civic_force/model/tag_post_by_city_model.dart';
import 'package:civic_force/model/tags_by_city_model.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerCity extends GetxController{
  List<Tags> listWithImage=[];
  List<Tags> listWithoutImage=[];
  final String? cityName;
  ControllerCity({this.cityName});
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    var res=await NetworkManager().get("${AppUrls.tagsByCity}?city=$cityName");
    print(res);
    TagsByCityModel tagsByCityModel=TagsByCityModel.fromJson(res);
    if(tagsByCityModel.data!=null)listWithImage.addAll(tagsByCityModel.data!.withImage??[]);
    if(tagsByCityModel.data!=null)listWithoutImage.addAll(tagsByCityModel.data!.withoutImage??[]);
    update();
  }
}