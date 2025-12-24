import 'package:get/get.dart';
import '../../../model/model_x.dart';
import '../../../network_handling/api_response.dart';
import '../../../network_handling/network_manager.dart';
import '../../../model/like_model.dart' as like_model;
import '../../../utils.dart';
import '../../../utils/app_urls.dart';

class ControllerPostItem extends GetxController{
  int indexLoadingSaved= -1;
  int indexLoadingLike= -1;
  ApiResponse apiResponseSavedPost=ApiResponse(status: Status.INITIAL);

  @override
  void onInit() {
    super.onInit();
  }

  likePost({id}) async {
    bool value=false;
    indexLoadingLike =id.toInt();
    update();
    try{
      var res=await NetworkManager().post(AppUrls.like,data: {
        "post_id":"$id"
      });
      like_model.LikeModel likeModel=like_model.LikeModel.fromJson(res);
      // int index=list.indexWhere((test)=>test.id==id);
      if(likeModel.status==200){
        value= true;
        // showToastSuccess(likeModel.message);
        // list[index].setLike=likeModel.data?.like??false;
        // if(likeModel.data?.like==true){
        //   list[index].setLikeCount=(list[index].likesCount??0)+1;
        // }else{
        //   list[index].setLikeCount=(list[index].likesCount??0)-1;
        // }
      }else{
        showToastError(likeModel.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
    indexLoadingLike = -1;
    update();
    return value;
  }

  postSavedPost({id}) async {
    bool value=false;
    apiResponseSavedPost = ApiResponse(status: Status.LOADING);
    indexLoadingSaved=id;
    update();
    try{
      var res=await NetworkManager().post(AppUrls.savedPost,data: {
        "post_id": "${id}"
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        value=true;
        // int index=list.indexWhere((test)=>"${test.id}"=="$id");
        // list[index].setSaved=modelX.data['saved']??false;
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}

    apiResponseSavedPost = ApiResponse(status: Status.COMPLETED);
    update();
    return value;
  }

}