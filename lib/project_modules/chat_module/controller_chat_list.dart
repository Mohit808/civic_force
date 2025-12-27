import 'package:civic_force/model/chat_list_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerChatList extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  int page=1;
  bool loadMore=true;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  refreshData(){
    list.clear();
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get(AppUrls.getChatList);
      ChatListModel chatListModel=ChatListModel.fromJson(res);
      if(chatListModel.status==200){
        list.addAll(chatListModel.data??[]);
        if(chatListModel.data!.length==10){
          page++;
          loadMore=true;
        }else{
          loadMore=false;
        }
      }
    }catch(e){}
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }
}