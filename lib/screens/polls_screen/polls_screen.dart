import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/polls_screen/widget/poll_item_widget.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller_polls.dart';
import 'create_poll/create_poll_screen.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPolls(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Polls"),
          body: SmartRefresher(controller: controller.refreshController,
            onLoading: controller.fetchData,
            onRefresh: controller.refreshData,
            enablePullUp: controller.loadMore,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(padding: EdgeInsets.only(bottom: 48),physics: NeverScrollableScrollPhysics(),itemCount: controller.list.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                  return PollItemWidget(data: controller.list[index],onVote: (){
                    controller.list[index].setVoted=true;
                    controller.update();
                  },onDeleteClick: (){
                    controller.list.removeAt(index);
                    controller.update();
                  },);
                  //   Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  //   SmallText(text: "${controller.list[index].question}",fontWeight: FontWeight.w600,size: 20,),
                  //   SizedBox(height: 8,),
                  //   Row(
                  //     children: [
                  //       SmallText(text: "Asked by ", color: Colors.black54,),
                  //       SmallText(text: (controller.list[index].user?.userId==userInfo?.userId)?"You":  controller.list[index].user?.name??"Anonymous",fontWeight: FontWeight.w500,),
                  //       SmallText(text: " about ${timeAgo(controller.list[index].createdAt)}",color: Colors.black54,),
                  //     ],
                  //   ),
                  //   SizedBox(height: 36,),
                  //
                  //   if(controller.list[index].options!=null && controller.list[index].hasVoted!=true)Column(spacing: 16,children: [
                  //     for(var x in controller.list[index].options!)
                  //       ContainerDecorated(onTap: (){
                  //         controller.selectedRadio=x.id;
                  //         controller.update();
                  //         // controller.postVote(pollOptionId: x.id);
                  //       },color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
                  //         SizedBox(height: 20,width: 20,child: Radio(value: controller.selectedRadio, groupValue: x.id, onChanged: (value){})),
                  //         SmallText(text: "${x.text}",fontWeight: FontWeight.w600,)
                  //       ],),),
                  //
                  //     SizedBox(),
                  //
                  //     if(controller.selectedRadio!=null &&  controller.list[index].options!=null && controller.list[index].options!.any((test)=>test.id==controller.selectedRadio))Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  //       ContainerDecorated(onTap: (){
                  //         controller.postVote(pollOptionId: controller.selectedRadio,index: index);
                  //       },borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 12),color: AppColors.primary,child: SmallText(text: "Submit your vote",color: Colors.white,fontWeight: FontWeight.w600,)),
                  //     ],),
                  //     // SizedBox(height: 24,),
                  //     // Divider(height: 36,)
                  //   ],),
                  //
                  //
                  //   if(controller.list[index].options!=null && controller.list[index].hasVoted==true)
                  //     Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  //
                  //       for (var x in controller.list[index].options!)
                  //         Container(decoration: BoxDecoration(color:  x.isWinner==true?Colors.deepPurple.withOpacity(0.03): Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                  //           child: Stack(
                  //             children: [
                  //               Row(children: [
                  //
                  //                 Expanded(flex: x.percentage!.round().clamp(0, 100), child: ContainerDecorated( padding: 16,color: x.isWinner==true?Colors.deepPurpleAccent.withOpacity(0.3): Colors.orange.withOpacity(0.15), borderRadius: 30,child:  SmallText(text: "1",fontWeight: FontWeight.w600,color: Colors.transparent,),),),
                  //
                  //                 Expanded(flex: 100 -(x.percentage!.round().clamp(0, 100)), child: Container(),),
                  //
                  //
                  //                 // Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 12,borderRadius: 30,child: SmallText(text: "${x.text}",fontWeight: FontWeight.w600,),)),
                  //                 // Expanded(flex: 3,child: Container())
                  //                 // SizedBox(width: 100-double.parse("${x.percentage??0}"),),
                  //               ],),
                  //               Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  //                 Expanded(child: Container(padding: EdgeInsets.all(16),child: SmallText(text: x.text,fontWeight: FontWeight.w600,),)),
                  //                 SmallText(text: "${x.percentage}%  ",fontWeight: FontWeight.w600,)
                  //               ],),
                  //
                  //
                  //             ],
                  //           ),
                  //         ),
                  //
                  //       Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  //         FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                  //         SizedBox(width: 8,),
                  //         Builder(
                  //           builder: (context) {
                  //             final totalVotes = controller.list[index].options?.map((o) => o.voteCount).fold(0, (sum, v) => sum + v!.toInt());
                  //             return SmallText(text: "$totalVotes");
                  //           }
                  //         ),
                  //
                  //         if("${controller.list[index].user?.userId}"=="${userInfo?.userId}")
                  //         controller.loadingDelete==index?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                  //         InkWell(onTap: (){
                  //           controller.deletePoll(controller.list[index].id,index: index);
                  //         }, child: Row(children: [
                  //             SizedBox(width: 30,),
                  //             Icon(Icons.delete,size: 16,color: Colors.redAccent,),
                  //             SizedBox(width: 8,),
                  //             SmallText(text: "Delete",color: Colors.red,fontWeight: FontWeight.w500,)
                  //           ],),
                  //         )
                  //
                  //       ],),
                  //       // SizedBox(height: 16,),
                  //       // Divider(),
                  //       // SizedBox(height: 16,),
                  //     ],)
                  //
                  //
                  //
                  // ],)
                  ;
                }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 48,); },)
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Get.to(()=>CreatePollScreen());
          },child: Icon(Icons.create),),
        );
      }
    );
  }
  
}


String timeAgo(String? dateString) {
  if(dateString==null) return "";
  if(dateString.isEmpty) return "";
  final date = DateTime.parse(dateString).toLocal();
  final diff = DateTime.now().difference(date);

  if (diff.inSeconds < 60) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours} hr ago';
  if (diff.inDays < 7) return '${diff.inDays} days ago';

  return '${date.day}/${date.month}/${date.year}';
}

