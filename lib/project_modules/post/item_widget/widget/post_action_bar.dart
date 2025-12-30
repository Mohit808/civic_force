import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../common_widget/app_colors.dart';
import '../../../../common_widget/container_decorated.dart';
import '../../../../common_widget/network_image_widget.dart';
import '../../../../common_widget/text_common.dart';
import '../../../../data_source/data_source_common.dart';
import '../../../../network_handling/api_response.dart';
import '../../../../screens/comment_screen/comment_screen.dart';
import 'package:civic_force/model/post_model.dart';

import '../../../../utils.dart';
import '../controller_post_item.dart';
import '../post_item_widget.dart';

class PostActionBar extends StatelessWidget {
  const PostActionBar({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPostItem(),
      builder: (controller) {
        return Row(children: [

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
        ]);
      }
    );
  }
}
