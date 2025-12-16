import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/model/post_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

import '../../model/like_model.dart' as like_model;

class ControllerHome extends GetxController{
  bool layoutChanged=true;
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseSavedPost=ApiResponse(status: Status.INITIAL);
  int indexLoadingSaved= -1;
  int indexLoadingLike= -1;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppUrls.post);
      // print(res);
      PostModel postModel=PostModel.fromJson(res);
      list.addAll(postModel.data!);
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      print(e);
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }


  likePost({id}) async {
    indexLoadingLike =id.toInt();
    update();
    try{
      var res=await NetworkManager().post(AppUrls.like,data: {
        "post_id":"$id"
      });
      like_model.LikeModel likeModel=like_model.LikeModel.fromJson(res);
      int index=list.indexWhere((test)=>test.id==id);
      if(likeModel.status==200){
        showToastSuccess(likeModel.message);
        list[index].setLike=likeModel.data?.like??false;
        if(likeModel.data?.like==true){
          list[index].setLikeCount=(list[index].likesCount??0)+1;
        }else{
          list[index].setLikeCount=(list[index].likesCount??0)-1;
        }
      }else{
        showToastError(likeModel.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
    indexLoadingLike = -1;
    update();
  }

  postSavedPost({id}) async {
    apiResponseSavedPost = ApiResponse(status: Status.LOADING);
    indexLoadingSaved=id;
    update();
    try{
      var res=await NetworkManager().post(AppUrls.savedPost,data: {
        "post_id": "${id}"
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        // list[index].setSaved=modelX.data['saved'];
        int index=list.indexWhere((test)=>"${test.id}"=="$id");
        list[index].setSaved=modelX.data['saved']??false;
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}

    apiResponseSavedPost = ApiResponse(status: Status.COMPLETED);
    update();
  }


}