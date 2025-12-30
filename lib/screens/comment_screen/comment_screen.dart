import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_widgets/no_data_widget.dart';
import 'package:civic_force/screens/home/home_screen.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller_comment.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, this.postId});
  final dynamic postId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerComment(postId: postId),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Comments"),
          body: SmartRefresher(controller: controller.refreshController,
            onLoading: controller.fetchData,
            onRefresh: controller.refreshData,
            enablePullUp: controller.loadMore,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              Expanded(
                child:

                controller.list.isEmpty?NoDataWidget(center: true,):
                ListView.separated(padding: EdgeInsets.all(16),itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                  return Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,children: [
                    ImageCommon( controller.list[index].user?.image??"",height: 40,width: 40,borderRadius: 30,),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                      children: [
                        SmallText(text: "${controller.list[index].user?.name}",fontWeight: FontWeight.w700,size: 15,),
                        SmallText(text: "${controller.list[index].text}",fontWeight: FontWeight.w400,),
                        Row(spacing: 8,children: [
                          SmallText(text: formatDateRelative(controller.list[index].createdAt),color: Colors.black54,),
                          ContainerDecorated(color: Colors.grey,height: 4,width: 4,),
                          SmallText(text: "144 likes",color: Colors.black54,),
                          ContainerDecorated(color: Colors.grey,height: 4,width: 4,),
                          InkWell(onTap: (){
                            controller.indexTextField=index;
                            controller.update();
                          },child: SmallText(text: "reply",color: Colors.black54,)),
                        ],),

                        if(controller.list[index].replyCount!=null && controller.list[index].replyCount!>0)
                          InkWell(onTap: (){
                            if(controller.indexViewComment==index){
                              controller.indexViewComment= -1;
                              controller.update();
                            }else{
                              controller.indexViewComment = index;
                              controller.refreshReplyComment(commentId: controller.list[index].id);
                            }
                          },
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,
                              children: [
                                Image.asset(AppImages.rightArrow,height: 16,width: 16,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(spacing: 8,
                                    children: [
                                      SmallText(text: "${controller.list[index].replyCount??0} replies",color: Colors.black54),
                                      controller.apiResponseFetchReply.status==Status.LOADING && controller.indexViewComment==index?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):Icon(Icons.keyboard_arrow_up_rounded,size: 16,color: Colors.black54,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),


                        if(controller.indexTextField==index)ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12),child: Column(
                          children: [
                            TextField(controller: controller.textEditingControllerReply,minLines: 2,maxLines: 4,onTapOutside: (a){hideKeyboard();},style: TextStyle(fontSize: 12),decoration: InputDecoration(border: InputBorder.none,isDense: true,hintText: "Enter text",hintStyle: TextStyle(fontSize: 12)),),
                            Row(mainAxisAlignment: MainAxisAlignment.end,spacing: 16,
                              children: [
                                ContainerDecorated(onTap: (){
                                  controller.indexTextField=-1;
                                  controller.textEditingControllerReply.text="";
                                  controller.update();
                                },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 4,horizontal: 8),child: SmallText(text: "Cancel")),
                                ContainerDecorated(onTap: (){
                                  controller.postReplyComment(commentId: controller.list[index].id);
                                },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 4,horizontal: 8),color: AppColors.primary,child: controller.apiResponseReply.status==Status.LOADING?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 3,)): SmallText(text: "Send",color: Colors.white,)),
                              ],
                            ),
                            SizedBox(height: 8,)
                          ],
                        )),



                        if(controller.indexViewComment==index)Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: controller.listReply.length,itemBuilder: (itemBuilder,index){
                            return Row(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                              ImageCommon( "${controller.listReply[index].user?.image}",height: 30,width: 30,borderRadius: 30,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                children: [
                                  SmallText(text: "${controller.listReply[index].user?.name}",fontWeight: FontWeight.w600,),
                                  SmallText(text: "${controller.listReply[index].text}")
                                ],
                              ),
                            ],);
                          }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
                        ),
                        if(controller.indexViewComment==index && controller.loadMoreReply)InkWell(onTap: (){
                          controller.fetchReplyComment(commentId: controller.list[index].id);
                        },child: Padding(
                          padding: const EdgeInsets.only(top: 16,bottom: 16),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
                            children: [
                              SmallText(text: "Load More",fontWeight: FontWeight.w600,color: Colors.orange,),
                              Icon(Icons.more_horiz,color: Colors.orange,)
                            ],
                          ),
                        ))

                      ],
                    )),

                    controller.apiResponseLike.status==Status.LOADING && controller.indexLoadingLike==index?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                    InkWell(onTap: (){
                      controller.likeCommentFunction(index: index);
                    },child: FaIcon(controller.list[index].isLiked==true?FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,size: 16,color: controller.list[index].isLiked==true?Colors.red:null,)),
                  ],);
                }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
                child: ContainerDecorated(color: Color(0xFFE3E3E3),paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 8,vertical: 6),borderRadius: 24,
                  child: Row(spacing: 16,children: [
                    Expanded(child: TextField(controller: controller.textEditingController,onTapOutside: (a){hideKeyboard();},minLines: 1,maxLines: 8,decoration: InputDecoration.collapsed(hintText: "Write your comment",hintStyle: TextStyle(fontSize: 12)),style: TextStyle(fontSize: 12),)),
                    ContainerDecorated(onTap: (){
                      controller.postData();
                    },borderRadius: 40,color: AppColors.primary,child: Icon(Icons.arrow_upward_rounded,color: Colors.white,))
                  ],),
                ),
              )
              // Divider(height: 20,)

            ],),
          ),
        );
      }
    );
  }
}
