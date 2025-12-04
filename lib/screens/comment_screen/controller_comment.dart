import 'package:civic_force/model/like_model.dart' as lm;
import 'package:civic_force/model/reply_comment_model.dart' as rm;
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/comment_model.dart';
import '../../model/model_x.dart' as x;

class ControllerComment extends GetxController{
  List<Data> list=[];
  List<rm.Data> listReply=[];
  int page=1;
  int pageReply=1;
  bool loadMore=false;
  bool loadMoreReply=false;
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseFetchReply=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseReply=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseLike=ApiResponse(status: Status.INITIAL);
  RefreshController refreshController=RefreshController();
  int indexTextField=-1;
  int indexViewComment=-1;
  int indexLoadingLike=-1;

  final dynamic postId;
  ControllerComment({this.postId});

  TextEditingController textEditingController=TextEditingController();
  TextEditingController textEditingControllerReply=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  refreshData(){
    page=1;
    loadMore=false;
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.comment}?post_id=$postId&page=$page");
      print(res);
      CommentModel commentModel=CommentModel.fromJson(res);
      list.addAll(commentModel.data??[]);
      if(commentModel.data?.length==10){
        page++;
        loadMore=true;
      }else{
        loadMore=false;
      }
    }catch(e){}
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }
  postData() async {
    if(textEditingController.text.isEmpty) return;
    String text=textEditingController.text;
    textEditingController.text="";
    try{
      var res=await NetworkManager().post(AppUrls.comment,data: {
        "post_id":"$postId",
        "text":text
      });
      x.ModelX modelX=x.ModelX.fromJson(res);
      list.insert(0,Data.fromJson(modelX.data));
    }catch(e){
      print(e);
    }
    update();
  }




  refreshReplyComment({commentId}){
    apiResponseFetchReply=ApiResponse(status: Status.LOADING);
    listReply=[];
    pageReply=1;
    update();
    fetchReplyComment(commentId: commentId);
  }
  fetchReplyComment({commentId}) async {
    try{
      var res= await NetworkManager().get("${AppUrls.replyComment}?comment_id=$commentId&page=$pageReply");
      print(res);
      rm.ReplyCommentModel replyCommentModel=rm.ReplyCommentModel.fromJson(res);
      listReply.addAll(replyCommentModel.data??[]);

      if(replyCommentModel.data?.length==10){
        pageReply++;
        loadMoreReply=true;
      }else{
        loadMoreReply=false;
      }

    }catch(e){}

    apiResponseFetchReply=ApiResponse(status: Status.COMPLETED);
    update();

  }
  postReplyComment({commentId}) async {
    if(textEditingControllerReply.text.isEmpty) return;
    if(apiResponseReply.status==Status.LOADING) return;
    apiResponseReply=ApiResponse(status: Status.LOADING);
    update();

    try{
      var res=await NetworkManager().post(AppUrls.replyComment,data: {
        "comment_id":"$commentId",
        "text":textEditingControllerReply.text
      });
      print(res);
      x.ModelX modelX=x.ModelX.fromJson(res);
      if(modelX.status==200){
        listReply.add(rm.Data.fromJson(modelX.data));
        textEditingControllerReply.text="";
        showToastSuccess(modelX.message);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }

    apiResponseReply=ApiResponse(status: Status.COMPLETED);
    update();

  }


  likeCommentFunction({index}) async {
    apiResponseLike=ApiResponse(status: Status.LOADING);
    indexLoadingLike= index;
    update();
    try{
      var res=await NetworkManager().post(AppUrls.likeComment,data: {
        "comment_id":"${list[index].id}"
      });
      lm.LikeModel likeModel=lm.LikeModel.fromJson(res);
      if(likeModel.status==200){
        showToastSuccess(likeModel.message);
        list[index].setLiked(likeModel.data?.like??false);
      }else{
        showToastError(likeModel.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
    apiResponseLike=ApiResponse(status: Status.COMPLETED);
    indexLoadingLike= -1;
    update();
  }
}