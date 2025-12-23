import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_widgets/loading_widget.dart';
import 'package:civic_force/network_handling/network_widgets/no_data_widget.dart';
import 'package:civic_force/screens/polls_screen/polls_screen.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_widget/app_colors.dart';
import 'controller_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerNotification(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: SmallText(text: "Notifications",size: 20,color: Colors.black,),color:AppColors.scaffoldBackgroundColor,centerTitle: false,titleColor: Colors.black,colorIconTheme: Colors.black,actions: [

            controller.apiResponseMarkRead.status==Status.LOADING?Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)),
                ),
              ],
            ):
            InkWell(onTap: (){
              controller.markAllReadNotifications();
            },
              child: Row(spacing: 8,
                children: [
                  Icon(Icons.check,size: 16,color: Colors.green,),
                  SmallText(text: "Mark all as read",color: Colors.black,fontWeight: FontWeight.w500,),
                  SizedBox(width: 16,)
                ],
              ),
            )
          ],),
          body: SmartRefresher(controller: controller.refreshController,
            onRefresh: controller.refreshData,
            onLoading: controller.fetchData,
            enablePullUp: controller.loadMore,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [

                  ContainerDecorated(padding: 2,
                    child: Row(spacing: 16,children: [
                      Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=0;controller.refreshData();},color: controller.selectedTab==0?Colors.white:null,padding: 8,child: SmallText(text: "All",color: controller.selectedTab==0?Colors.black:Colors.black54,textAlign: TextAlign.center,fontWeight: FontWeight.w500,),)),
                      Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=1;controller.refreshData();},color:controller.selectedTab==1? Colors.white:null,padding: 8,child: SmallText(text: "Unread",color: controller.selectedTab==1?Colors.black:Colors.black54,textAlign: TextAlign.center,fontWeight: FontWeight.w500,),)),
                      Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=2;controller.refreshData();},color:controller.selectedTab==2? Colors.white:null,padding: 8,child: SmallText(text: "Archived",color: controller.selectedTab==2?Colors.black:Colors.black54,textAlign: TextAlign.center,fontWeight: FontWeight.w500,),)),
                    ],),
                  ),

                  SizedBox(height: 24,),

                  controller.apiResponse.status==Status.LOADING?LoadingWidget():
                      controller.list.isEmpty?NoDataWidget():
                  ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: controller.list.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                    return Dismissible(

                      confirmDismiss: (direction) async {
                        bool isDelete = false;
                        if(direction == DismissDirection.endToStart){
                          isDelete=true;
                        }
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('${isDelete?"Delete":"Archive"}?'),
                            content: Text('Are you sure you want to ${isDelete?"Delete":"Archive"} this item?'),
                            actions: [
                              TextButton(onPressed: (){
                                Get.back();
                              }, child: const Text('Cancel')),
                              TextButton(onPressed: (){
                                Get.back();
                                if(isDelete){
                                  controller.deleteNotification(controller.list[index].id,index: index);
                                }else{
                                  controller.archiveMessage(controller.list[index].id,index: index);
                                }
                              }, child: const Text('Delete')),
                            ],
                          ),
                        );
                        return false;
                      },
                      background: ContainerDecorated(color: Colors.blue,child: const Icon(Icons.archive, color: Colors.white),),
                      secondaryBackground: ContainerDecorated(color: Colors.red,child: const Icon(Icons.delete_outline, color: Colors.white),),
                      key: GlobalKey(),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,children: [
                        Stack(
                          children: [
                            ImageCommon(src: "${controller.list[index].sender?.name}",height: 45,width: 45,),
                            if(controller.list[index].isRead!=true)ContainerDecorated(color: Colors.red,height: 8,width: 8,)
                          ],
                        ),
                        Expanded(
                          child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                            Wrap(spacing: 4,runSpacing: 4,children: [
                              SmallText(text: "${controller.list[index].sender?.name}",fontWeight: FontWeight.w600,size: 16,),
                              SmallText(text: "${getMessageFromType(controller.list[index].notificationType)}",size: 16,),
                              if(controller.list[index].post?.text!=null && controller.list[index].post?.image==null)SmallText(text: "${controller.list[index].post?.text}"),
                              if(controller.list[index].replyComment==null && controller.list[index].comment!=null)SmallText(text: " ${controller.list[index].comment?.text}",fontWeight: FontWeight.w500,maxLine: 1,size: 15,overflow: TextOverflow.ellipsis,),
                            ],),
                            if(controller.list[index].replyComment!=null)Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8, children: [
                                if(controller.list[index].comment!=null)SmallText(text: " ${controller.list[index].comment?.text}",fontWeight: FontWeight.w500,maxLine: 1,size: 15,overflow: TextOverflow.ellipsis,),


                              Container(decoration: BoxDecoration(color: Colors.grey.shade400,borderRadius: BorderRadius.circular(10)),child: ContainerDecorated(padding: 8,marginEdgeInsets: EdgeInsets.only(left: 6),color: Colors.white,child: Text("${controller.list[index].replyComment?.text}")))

                                // Row(spacing: 8,children: [
                                //   ContainerDecorated(height: 40,width: 4,color: Colors.grey.shade400,),
                                //   Expanded(child: Text("${controller.list[index].replyComment?.text}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),))
                                // ],),
                              ],
                            ),
                            SmallText(text: timeAgo(controller.list[index].createdAt,),fontWeight: FontWeight.w500,color: Colors.black54,size: 13,)
                          ],),
                        ),

                        if(controller.list[index].post?.image!=null)ImageCommon(src: "${controller.list[index].post?.image}",height: 50,width: 50,fit: BoxFit.cover,borderRadius: 10,)
                      ],),
                    );


                  }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 36,); },)
                ],),
              ),
            ),
          ),
        );
      }
    );
  }
  getMessageFromType(type){
    if(type=="like"){
      return "liked your post";
    }else if(type=="comment"){
      return "commented on your post";
    }
    else if(type=="follow"){
      return "followed you";
    }else if(type=="mention"){
      return "mentioned you";
    }
    else if(type=="replyComment"){
      return "replied on your comment";
    }
    else if(type=="poll"){
      return "voted on your poll";
    }
    else{
      return "";
    }
  }
}
