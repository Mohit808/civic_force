import 'dart:convert';

import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/model/chat_message_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data_source/upload_to_s3.dart';
import '../../../enums/media_type_enum.dart';
import '../../../model/model_x.dart';
import 'widget/delete_message/delete_message_dialog.dart';

class ControllerOneToOne extends GetxController{
  dynamic userId;
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  bool loadMore=false;
  int page=1;
  bool isEmojiShowing=false;
  ControllerOneToOne({this.userId});

  TextEditingController textEditingController=TextEditingController();

  List<int> selectedIndexList=[];
  dynamic replyId;
  dynamic replyText;
  dynamic replyUser;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.getChatMessages}?page=$page&user_id=$userId");
      ChatMessageModel chatMessageModel=ChatMessageModel.fromJson(res);
      list.addAll((chatMessageModel.data??[]));
      if(chatMessageModel.data?.length==10){
        page++;
        loadMore=true;
      }else{
        loadMore=false;
      }
    }catch(e){}
    update();
  }


  sendMessage({message,mediaType,mediaUrl,mediaSize}) async {
    if(mediaType=="text"){
      list.insert(0, Data(message: textEditingController.text,type: "chat",mediaType:mediaType??"text",mediaUrl: mediaUrl, sender: userInfo?.userId,receiver: userId,replyId: replyId,replyText: replyText,replyUser: replyUser,read: true,createdAt: DateTime.now().toIso8601String()));
      update();
      textEditingController.text="";
    }
    var res=await DataSourceCommon().sendMessagePost(userId: userId,message: message,type: "chat",mediaType:mediaType??"text", mediaUrl: mediaUrl ,mediaSize: mediaSize,replyId: replyId,replyText: replyText,replyUser: replyUser);
    if(res.id!=null){
      int index=list.indexWhere((test)=>test.id==null && "${test.message}".startsWith(message));
      if(index != -1){
        list.removeAt(index);
        list.insert(index, res);
      }else{
        list.insert(0, res);
      }
      if(replyId!=null){
        replyId=null;
        replyText=null;
        replyUser=null;
      }
      update();
    }
  }


  deleteMessage(){
    showDialog(context: Get.context!, builder: (builder){
      return DeleteMessageDialog(onTap: () async {


        final ids = selectedIndexList.map((x) => list[x].id).toList();

        print(token);
        var res=await NetworkManager().delete(AppUrls.deleteMessage,data: jsonEncode({
          "message_ids":ids,
        }));
        print(res);
        ModelX modelX=ModelX.fromJson(res);
        if(modelX.status==200){
          showToastSuccess(modelX.message);
          for(var x in selectedIndexList){
            list.removeAt(x);
            // listGlobalKey.removeAt(x);
          }
          selectedIndexList.clear();
          update();
        }else{
          showToastError(modelX.message);
        }
      },);
    });
  }

  copyData(){
    String msg="";
    for(var x in selectedIndexList){
      if(msg.isEmpty){
        msg=list[x].message??"";
      }else{
        msg="$msg  ${list[x].message}";
      }
    }
    Clipboard.setData(ClipboardData(text: msg,));
    selectedIndexList.clear();
    update();
  }



  uploadMultipleFile(onValue) async {
    if(onValue!=null){

      for(var x in onValue){

        dynamic length;
        if(x.runtimeType == PlatformFile){
          length=x.size;
        }else{
          length=await x.length();
        }
        double sizeInMb=(length/1024/1024);
        String mediaSize=sizeInMb.toStringAsFixed(2);
        if(sizeInMb<50){
          final mediaType = getMediaTypeFromPath(x.path);

          if(mediaType==MediaType.video){
            final tempDir = await getTemporaryDirectory();
            final thumbnailPath = await VideoThumbnail.thumbnailFile(video: x.path, thumbnailPath: tempDir.path, imageFormat: ImageFormat.PNG, quality: 80,);

            list.insert(0, Data(message: mediaType.value,type: "chat",mediaType:mediaType.value,mediaUrl: "$thumbnailPath,${x.path}" , mediaSize: mediaSize, sender: userInfo?.userId,receiver: userId,read: true,createdAt: DateTime.now().toIso8601String()));
            update();

            var urlThumbnail=await uploadImageToS3(thumbnailPath);
            var url=await uploadImageToS3(x.path);
            sendMessage(mediaSize: mediaSize,mediaType: mediaType.value,mediaUrl: "$urlThumbnail,$url",message: mediaType.value,);
            update();
            return;
          }

          list.insert(0, Data(message: mediaType.value,type: "chat",mediaType:mediaType.value,mediaUrl: x.path , mediaSize: mediaSize, sender: userInfo?.userId,receiver: userId,read: true,createdAt: DateTime.now().toIso8601String()));
          update();
          uploadImageToS3(x.path).then((url){
            if(url!=null){
              sendMessage(mediaSize: mediaSize,mediaType: mediaType.value,mediaUrl: url,message: mediaType.value);
            }else{
              debugPrint("Image failed to upload");
              showToastError("Image failed to upload");
            }
          });
        }else{
          showToastError("Cant upload more than 50 image size video");
        }
      }
    }
  }

  setReply(index){
    replyId=list[index].id;
    replyText=list[index].message;
    if("${list[index].sender}"=="${userInfo?.userId}"){
      replyUser="${userInfo?.userId}";
    }else{
      replyUser="$userId";
    }
    update();
  }

}