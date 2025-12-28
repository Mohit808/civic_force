import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/model/post_model.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/analysis_detail_screen.dart';
import 'package:civic_force/screens/home/controller_home.dart';
import 'package:civic_force/screens/polls_screen/widget/controller_post_item.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/network_image_widget.dart';
import '../../../common_widget/text_common.dart';
import '../../../data_source/data_source_common.dart';
import '../../../network_handling/api_response.dart';
import '../../../screens/comment_screen/comment_screen.dart';
import '../../../screens/home/home_screen.dart';
import '../../../screens/polls_screen/widget/poll_item_widget.dart';
import '../../../screens/user_profile/user_profile_screen.dart';
import '../controller_post_list.dart';
import 'controller_post_item.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({super.key, required this.data, this.hideRetweet});

  final Data data;
  final bool? hideRetweet;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPostItem(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0,top: 8),
          child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
            Row(
              children: [
                InkWell(onTap: (){
                  Get.to(()=>UserProfileScreen(userId: data.user?.userId,name: data.user?.name,image: data.user?.image,));
                },
                  child: Row(
                    children: [
                      SizedBox(height: 40,width:40,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: ImageCommon( data.user?.image?? "https://i.pinimg.com/1200x/f0/38/38/f038383985e6289f4c208150818e01ab.jpg",))),
                      SizedBox(width: 16,),
                      SmallText(text: data.user?.userId==userInfo?.userId?"You": data.user?.name??"Ivan",fontWeight: FontWeight.w600,letterSpacing: 0.3,size: 16,),
                      SizedBox(width: 16,),
                      ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black54,),
                      SizedBox(width: 8,),
                      SmallText(text: formatDateRelative(data.createdAt),color: Colors.black54,size: 12,),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 4,),
            if(data.text!=null&&data.text!.isNotEmpty)SmallText(text: data.text??"",size: 16,),
            if(data.image!=null && data.image!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8),
              child:
              GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount:data.image!.split(",").length==1?1:2,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: data.image!.split(",").length,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1), itemBuilder: (itemBuilder,indexXX){
                return ImageCommon( data.image!.split(",")[indexXX],borderRadius: 15,);
              }),
            ),

            if(data.retweetedPost!=null) ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade400,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16),margin: 8,
              child: PostItemWidget(data: data.retweetedPost!,hideRetweet: true,),
            ),


            if(data.poll!=null) SizedBox(height: 16,),
            if(data.poll!=null)ContainerDecorated(marginEdgeInsets: EdgeInsets.only(bottom: 8),padding: 16,color: Colors.white,colorBorder: Colors.grey.shade400,
              child: PollItemWidget(data: data.poll,onVote: (){
                data.poll!.setVoted=true;
                controller.update();
              },onDeleteClick: (){
                // controller.list.removeWhere((test)=>test.id==data.id);
                controller.update();
              },),
            ),





            if(hideRetweet!=true)SizedBox(height: 8,),
            if(hideRetweet!=true)Row(children: [

              Expanded(
                child: Row(children: [
                  data.id==controller.indexLoadingLike? SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)) :
                  InkWell(onTap: () async {
                    var res=await controller.likePost(id: data.id);
                    if(res==true){
                      data.setLike=!data.isLiked;
                      if(data.isLiked){
                        data.setLikeCount=((data.likesCount?.toInt()??0)+1);
                      }else{
                        data.setLikeCount=((data.likesCount?.toInt()??0)-1);
                      }
                      controller.update();
                    }
                  }, child: Row(children: [
                    FaIcon(data.isLiked==true? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,size: 16,color: data.isLiked==true?Colors.red:Colors.black54,),
                    SizedBox(width: 8,),
                    SmallText(text: "${data.likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
                  ],),)
                ],),
              ),

              Expanded(
                child: InkWell(onTap: (){
                  showDialog(context: context, builder: (builder){
                    return Dialog(insetPadding: EdgeInsets.zero,child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [
                            Expanded(child: SmallText(text: "Re-Post",fontWeight: FontWeight.w700,size: 16,)),
                            InkWell(onTap: (){
                              Get.back();
                            },child: Icon(Icons.close))
                          ],),
                          // SizedBox(height: 16,),
                          ContainerDecorated(color: Colors.white,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16),child: PostItemWidget(data: data)),
                          SizedBox(height: 16,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(spacing: 8,children: [
                                ImageCommon( "${userInfo?.image}",height: 40,width: 40,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                  children: [
                                    SmallText(text: "${userInfo?.name}",fontWeight: FontWeight.w700,size: 14,),
                                    Row(spacing: 4,
                                      children: [
                                        Icon(Icons.language,size: 12,color: Colors.green,),
                                        SmallText(text: "public",color: Colors.green,fontWeight: FontWeight.w600,)
                                      ],
                                    ),
                                  ],
                                )
                              ],),
                              ContainerDecorated(onTap: (){
                                DataSourceCommon().retweetFunction(data.id);
                              },color: AppColors.primary,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                child: Row(mainAxisSize: MainAxisSize.min,spacing: 8,
                                  children: [
                                    SmallText(text: "Send post",color: Colors.white,fontWeight: FontWeight.w600,),
                                    Icon(Icons.send,size: 16,color: Colors.white,),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),);
                  });
                },
                  child: Row(children: [
                    FaIcon(FontAwesomeIcons.retweet,size: 16,color: Colors.black54,),
                    SizedBox(width: 8,),
                    SmallText(text: "${data.retweetCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
                  ],),
                ),
              ),


              Expanded(
                child: InkWell(onTap: (){
                  Get.to(()=>CommentScreen(postId: data.id,));
                },
                  child: Row(children: [
                    FaIcon(FontAwesomeIcons.commentDots,size: 16,color: Colors.black54,),
                    SizedBox(width: 8,),
                    SmallText(text: "${data.commentsCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
                  ],),
                ),
              ),

              Expanded(
                child: Row(children: [
                  FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                  SizedBox(width: 8,),
                  SmallText(text: "-1",fontWeight: FontWeight.w600,color: Colors.black54,),
                ],),
              ),

              Expanded(
                child: InkWell(onTap: () async {
                  var res=await controller.postSavedPost(id: data.id);
                  if(res==true){
                    bool b=false;
                    if(data.isSaved!=null){
                      b=data.isSaved!;
                    }
                    data.setSaved=!b;
                    controller.update();
                  }
                },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    controller.apiResponseSavedPost.status==Status.LOADING && controller.indexLoadingSaved==data.id!.toInt()?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                    FaIcon(data.isSaved==true?FontAwesomeIcons.solidBookmark: FontAwesomeIcons.bookmark,size: 14,color: data.isSaved==true?Colors.red:Colors.black54,),
                    SizedBox(width: 8,)
                  ],),
                ),
              ),


              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.shareFromSquare,size: 16,color: Colors.black54,),
                ],
              ),
            ],),
            if(data.tagList!=null && data.tagList!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(spacing: 16,runSpacing: 8,children: [
                for(var x in data.tagList!)
                  InkWell(onTap: (){
                    Get.to(()=>AnalysisDetailScreen(tagName: x.name));
                  },child: SmallText(text: "#${x.name}",color: Colors.blue,fontWeight: FontWeight.w400,size: 15,))
              ],),
            ),

            if(data.peopleTagged!=null && data.peopleTagged!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Wrap(spacing: 16,runSpacing: 8,children: [
                for(var x in data.peopleTagged!)
                  InkWell(onTap: (){
                    Get.to(()=>UserProfileScreen(userId: x.userId,name: x.name,image: x.image,));
                  },child: SmallText(text: "@${x.name}",color: Colors.blue,fontWeight: FontWeight.w400,size: 15,))
              ],),
            ),
            if(data.location!=null && data.location!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(spacing: 4,
                  children: [
                    Icon(Icons.location_on_outlined,color:Colors.black54,size: 18,),
                    Expanded(child: SmallText(text: "${data.location}",size: 14,color: Colors.black54,maxLine: 1,overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              )
          ],),
        );
      }
    );
  }
}
