import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/model/notification_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ControllerNotification extends GetxController{
  List<Data> list=[];
  bool loadMore=false;
  int page=1;
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseMarkRead=ApiResponse(status: Status.INITIAL);
  int selectedTab = 0;
  RefreshController refreshController=RefreshController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  refreshData(){
    list=[];
    loadMore=false;
    page=1;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.notification}?page=$page&unread=${selectedTab==1?"true":""}&archived=${selectedTab==2?"true":""}");
      print(res);
      NotificationModel notificationModel=NotificationModel.fromJson(res);
      if(notificationModel.status==200){
        list.addAll(notificationModel.data??[]);
      }
    }catch(e){}

    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }


  deleteNotification(notificationId,{index}) async {
    try{
      var res=await NetworkManager().delete(AppUrls.notification,data: {
        "notification_id":"$notificationId"
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        list.removeAt(index);
        update();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
  }

  archiveMessage(notificationId,{index}) async {
    try{
      var res=await NetworkManager().put(AppUrls.notification,data: {
        "notification_id":"$notificationId",
        "is_archived":true
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        list[index].setArchived=true;
        update();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
  }

  markAllReadNotifications() async {
    apiResponseMarkRead=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppUrls.markAllReadNotifications);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);

        final updatedList = list.map((element) {
          return element.copyWith(isRead: true);
        }).toList();
        list=updatedList;

      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
    apiResponseMarkRead=ApiResponse(status: Status.COMPLETED);
    update();
  }
}