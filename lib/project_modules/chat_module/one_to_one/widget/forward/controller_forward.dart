import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/model/chat_list_model.dart';
import 'package:civic_force/model/chat_message_model.dart' as cm;
import 'package:civic_force/project_modules/chat_module/controller_chat_list.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/controller_one_to_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ControllerForward extends GetxController{

  List<Data> listSelected=[];

  @override
  void onInit() {
    super.onInit();

  }

  forwardMessage(ControllerChatList controllerChatList) async {
    List<cm.Data> listData=[];
    try{
      ControllerOneToOne controllerOneToOne=Get.find();
      for(var x in controllerOneToOne.selectedIndexList){
        var data = controllerOneToOne.list[x];
        for(var x in listSelected){
          cm.Data data2=await DataSourceCommon().sendMessagePost(userId: x.userId,message: data.message,type: data.type,mediaType: data.mediaType,mediaUrl: data.mediaUrl,mediaSize: data.mediaSize,replyId: data.replyId,replyText: data.replyText );
          listData.add(data2);
        }
      }

      if(listData.isNotEmpty){
       for(var x in listSelected){
         for(var dataX in listData){
           if("${controllerOneToOne.userId}"=="${x.userId}"){
             controllerOneToOne.list.insert(0, dataX);
           }
           int index=controllerChatList.list.indexWhere((test)=>"${test.userId}"=="${x.userId}");
           if(index!= -1){
             var data3=controllerChatList.list[index];
             controllerChatList.list.removeAt(index);
             controllerChatList.list.insert(index, Data(name: data3.name,image: data3.image,userId: data3.userId,lastMessage: dataX.message,lastMessageTime: dataX.createdAt,unreadCount: 0,lastMessageByYou: true));
             controllerChatList.update();
           }
         }
       }
      }

      controllerOneToOne.selectedIndexList.clear();
      controllerOneToOne.update();
    }catch(e){
      debugPrint("ERRRRROR $e");
    }
    Get.back();
  }
}