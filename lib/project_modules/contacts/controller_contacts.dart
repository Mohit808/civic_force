import 'package:get/get.dart';

import '../../data_source/data_source_contacts.dart';
import '../../model/contact_model.dart';
import '../../network_handling/network_manager.dart';
import '../../utils/app_urls.dart';

class ControllerContacts extends GetxController{

  List<Data> list=[];
  List<Data> listInvite=[];

  @override
  void onInit() {
    super.onInit();
    DataSourceContacts().askContacts();
    fetchData();
  }

  fetchData({invite}) async {
    try{
      var res=await NetworkManager().get(AppUrls.contact);
      ContactModel contactModel=ContactModel.fromJson(res);
      list.addAll((contactModel.data ?? []).where((e) => e.registeredUserId !=null ).toList());
      listInvite.addAll((contactModel.data ?? []).where((e) => e.registeredUserId ==null).toList());
    }catch(e){}
    update();
  }
}