
import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/project_modules/city/controllerCityMain.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

import '../model/city_model.dart' as cm;
import '../model/search_user_model.dart' as um;
import 'package:civic_force/model/tags_model.dart' as tm;
import '../../model/post_model.dart' as pm;
import '../../model/trending_tags_model.dart' as trm;
import '../../model/chat_message_model.dart' as chm;

class DataSourceCommon {

  retweetFunction(retweetId) async {
    try{
      var res=await NetworkManager().post(AppUrls.post,data:{
        "retweeted_post": "$retweetId"
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        Get.back();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
  }

  Future<List<um.Data>> fetchUsers({page,search}) async {
    var res=await NetworkManager().get("${AppUrls.userSearch}?page=${page??""}&search=${search??""}");
    um.SearchUserModel searchUserModel=um.SearchUserModel.fromJson(res);
    return searchUserModel.data??[];
  }

  Future<List<tm.Data>> fetchTags({page,search,hideCount}) async {
    try{
      var res=await NetworkManager().get("${AppUrls.tags}?page=${page??""}&search=${search??""}&hide_count=${hideCount??""}");
      tm.TagsModel tagsModel=tm.TagsModel.fromJson(res);
      return tagsModel.data??[];
    }catch(e){}
    return [];
  }

  Future<List<cm.Data>> fetchCity({page,search,noImage,hideCount}) async {
    try{
      var res=await NetworkManager().get("${AppUrls.city}?page=${page??""}&search=${search??""}&no_image=${noImage??""}&hide_count=${hideCount??""}");
      cm.CityModel cityModel=cm.CityModel.fromJson(res);
      if(cityModel.status==200){
        return cityModel.data??[];
      }
    }catch(e){}
    return [];
  }

  Future<List<pm.Data>> fetchPosts({page,city,tags,userId,my,saved,withMedia,top}) async {
    try{
      var res=await NetworkManager().get("${AppUrls.post}?page=${page??""}&city=${city??""}&tags=${tags??""}&user_id=${userId??""}&my=${my??""}&saved=${saved??""}&withMedia=${withMedia??""}&top=${top??""}");
      pm.PostModel postModel = pm.PostModel.fromJson(res);
      if(postModel.status==200){
        return postModel.data??[];
      }
    }catch(e){}
    return [];
  }

  Future<trm.Data> fetchTrendingTags() async {
    try{
      var res=await NetworkManager().get("${AppUrls.trendingTags}?city=$myCity");
      trm.TrendingTagsModel postModel = trm.TrendingTagsModel.fromJson(res);
      if(postModel.status==200){
        return postModel.data!;
      }
    }catch(e){}
    return trm.Data();
  }



  Future<chm.Data> sendMessagePost({userId,message,type,mediaType,mediaUrl, mediaSize ,replyId,replyText,replyUser}) async {
    try{
      var res=await NetworkManager().post(AppUrls.sendMessage,data: {
        "user_id":"$userId",
        "message":"$message",
        "type":"chat",
        "media_type": mediaType??"",
        "media_url":mediaUrl??"",
        "media_size":mediaSize??"",
        "reply_id":replyId??"",
        "reply_text": replyText??"",
        "reply_user": replyUser??"",
      });
      print(res);
      chm.Data chatMessageModel=chm.Data.fromJson(res['data']);
      return chatMessageModel;
    }catch(e){
      print(e);
    }

    return chm.Data();
  }

}