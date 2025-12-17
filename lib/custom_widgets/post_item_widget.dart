import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/model/post_model.dart';
import 'package:civic_force/screens/home/controller_home.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../common_widget/container_decorated.dart';
import '../common_widget/network_image_widget.dart';
import '../common_widget/text_common.dart';
import '../data_source/data_source_common.dart';
import '../network_handling/api_response.dart';
import '../screens/comment_screen/comment_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/retweet/retweet_widget.dart';
import '../screens/user_profile/user_profile_screen.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({super.key, required this.controller, required this.data, this.hideRetweet});
  final ControllerHome controller;
  final Data data;
  final bool? hideRetweet;

  // final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,top: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
        controller.layoutChanged?SizedBox():SizedBox(height: 40,width: 40,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
        controller.layoutChanged?SizedBox():SizedBox(width: 16,),
        Expanded(
          child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
            Row(
              children: [
                InkWell(onTap: (){
                  Get.to(()=>UserProfileScreen());
                },
                  child: Row(
                    children: [
                      !controller.layoutChanged?SizedBox(): SizedBox(height: 24,width: 24,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: ImageCommon(src: data.user?.image?? "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                      !controller.layoutChanged?SizedBox(): SizedBox(width: 8,),
                      SmallText(text: "${data.user?.name??"Ivan"}",fontWeight: FontWeight.w700,letterSpacing: 0.3,),
                      SizedBox(width: 16,),
                      ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black54,),
                      SizedBox(width: 8,),
                      SmallText(text: formatDateRelative(data.createdAt),color: Colors.black54,size: 11,),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 4,),
            if(data.text!=null&&data.text!.isNotEmpty)SmallText(text: data.text??""),
            if(data.image!=null && data.image!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8),
              child:
              GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount:data.image!.split(",").length==1?1:2,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: data.image!.split(",").length,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1), itemBuilder: (itemBuilder,indexXX){
                return ImageCommon(src: data.image!.split(",")[indexXX],fit: BoxFit.cover,borderRadius: 15,);
              }),
              // SizedBox(width: double.infinity,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(src: controller.list[index].image?.split(",").first??"https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
            ),

            if(data.retweetedPost!=null) ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16),margin: 8,
              child: PostItemWidget(controller: controller, data: data.retweetedPost!,hideRetweet: true,),
            ),
            if(hideRetweet!=true)SizedBox(height: 8,),
            if(hideRetweet!=true)Row(children: [

              controller.list.any((test)=>"${test.id}"=="${controller.indexLoadingLike}")?
              // controller.indexLoadingLike==index ?
              SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)) :InkWell(onTap: (){
                controller.likePost(id: data.id);
              }, child: Row(children: [
                FaIcon(data.isLiked==true? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,size: 16,color: data.isLiked==true?Colors.red:Colors.black54,),
                SizedBox(width: 8,),
                SmallText(text: "${data.likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
              ],),),

              Spacer(),
              InkWell(onTap: (){
                showDialog(context: context, builder: (builder){
                  return Dialog(backgroundColor: Color(0xFFC8C8C2),insetPadding: EdgeInsets.zero,child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [
                          Expanded(child: SmallText(text: "Re-Tweet",fontWeight: FontWeight.w700,size: 16,)),
                          InkWell(onTap: (){
                            Get.back();
                          },child: Icon(Icons.close))
                        ],),
                        SizedBox(height: 16,),
                        ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16),child: PostItemWidget(controller: controller, data: data)),
                        SizedBox(height: 16,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(spacing: 8,children: [
                              ImageCommon(src: "${userInfo?.image}",height: 40,width: 40,),
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
                // showModalBottomSheet(context: context, builder: (builder){
                //   return Dialog(child: PostItemWidget(controller: controller, index: index),);
                //   // return Dialog(child: RetweetWidget(index: index,),);
                // });
              },
                child: Row(children: [
                  FaIcon(FontAwesomeIcons.retweet,size: 16,color: Colors.black54,),
                  SizedBox(width: 8,),
                  SmallText(text: "${data.retweetCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
                ],),
              ),


              Spacer(),
              InkWell(onTap: (){
                Get.to(()=>CommentScreen(postId: data.id,));
              },child: FaIcon(FontAwesomeIcons.commentDots,size: 16,color: Colors.black54,)),
              SizedBox(width: 8,),
              SmallText(text: "${data.likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


              Spacer(),
              FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
              SizedBox(width: 8,),
              SmallText(text: "${data.likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


              Spacer(),
              controller.apiResponseSavedPost.status==Status.LOADING && controller.indexLoadingSaved==data.id!.toInt()?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
              InkWell(onTap: (){
                controller.postSavedPost(id: data.id);
              },child: FaIcon(data.isSaved==true?FontAwesomeIcons.solidBookmark: FontAwesomeIcons.bookmark,size: 14,color: data.isSaved==true?Colors.red:Colors.black54,)),
              SizedBox(width: 16,),
              // SmallText(text: "Saved",fontWeight: FontWeight.w600,color: Colors.black54,),

              SizedBox(width: 16,),
              // Spacer(),
              FaIcon(FontAwesomeIcons.shareFromSquare,size: 16,color: Colors.black54,),
              // SizedBox(width: 8,),
              // SmallText(text: "Share",fontWeight: FontWeight.w600,color: Colors.black54,),
            ],),
            if(data.tagList!=null && data.tagList!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(spacing: 16,runSpacing: 8,children: [
                for(var x in data.tagList!)
                  SmallText(text: "#${x.name}",color: Colors.blue,fontWeight: FontWeight.w600,)
              ],),
            ),

            if(data.peopleTagged!=null && data.peopleTagged!.isNotEmpty)Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(spacing: 16,runSpacing: 8,children: [
                for(var x in data.peopleTagged!)
                  InkWell(onTap: (){
                    Get.to(()=>UserProfileScreen());
                  },child: SmallText(text: "@${x.name}",color: Colors.blue,fontWeight: FontWeight.w600,))
              ],),
            ),
            if(data.location!=null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(spacing: 4,
                  children: [
                    Icon(Icons.location_on_outlined,color:Colors.deepOrange,size: 16,),
                    SmallText(text: "${data.location}",size: 13,color: Colors.deepOrange,),
                  ],
                ),
              )
          ],),
        )
      ],),
    );
  }
}
