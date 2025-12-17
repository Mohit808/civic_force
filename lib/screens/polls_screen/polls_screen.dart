import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller_polls.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPolls(),
      builder: (controller) {
      print(token);
        return Scaffold(
          appBar: AppBarCommon(title: "Polls"),
          body: SmartRefresher(controller: controller.refreshController,
            onLoading: controller.fetchData,
            onRefresh: controller.refreshData,
            enablePullUp: controller.loadMore,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(itemCount: controller.list.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "${controller.list[index].question}",fontWeight: FontWeight.w600,size: 20,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        SmallText(text: "Asked by ", color: Colors.black54,),
                        SmallText(text: controller.list[index].user?.name??"Anonymous",fontWeight: FontWeight.w500,),
                        SmallText(text: " about ${timeAgo(controller.list[index].createdAt)}",color: Colors.black54,),
                      ],
                    ),
                    SizedBox(height: 36,),

                    if(controller.list[index].options!=null && controller.list[index].hasVoted!=true)Column(spacing: 16,children: [
                      for(var x in controller.list[index].options!)
                        ContainerDecorated(onTap: (){
                          controller.postVote(pollOptionId: x.id);
                        },color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
                          SizedBox(height: 20,width: 20,child: Radio(value: false, groupValue: true, onChanged: (value){})),
                          SmallText(text: "${x.text}",fontWeight: FontWeight.w600,)
                        ],),),

                      SizedBox(height: 16,),

                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        ContainerDecorated(borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: Colors.green,child: SmallText(text: "Submit your vote",color: Colors.white,fontWeight: FontWeight.w600,)),
                      ],),
                    ],),


                    if(controller.list[index].options!=null && controller.list[index].hasVoted==true)
                      Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,children: [

                        for (var x in controller.list[index].options!)
                          Container(decoration: BoxDecoration(color:  x.isWinner==true?Colors.deepPurple.withOpacity(0.03): Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                            child: Stack(
                              children: [
                                Row(children: [

                                  Expanded(flex: x.percentage!.round().clamp(0, 100), child: ContainerDecorated( padding: 16,color: x.isWinner==true?Colors.deepPurpleAccent.withOpacity(0.3): Colors.orange.withOpacity(0.15), borderRadius: 30,child:  SmallText(text: x.text,fontWeight: FontWeight.w600,color: Colors.transparent,),),),

                                  Expanded(flex: 100 -(x.percentage!.round().clamp(0, 100)), child: Container(),),


                                  // Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 12,borderRadius: 30,child: SmallText(text: "${x.text}",fontWeight: FontWeight.w600,),)),
                                  // Expanded(flex: 3,child: Container())
                                  // SizedBox(width: 100-double.parse("${x.percentage??0}"),),
                                ],),
                                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                  Expanded(child: Container(padding: EdgeInsets.all(16),child: SmallText(text: x.text,fontWeight: FontWeight.w600,),)),
                                  SmallText(text: "${x.percentage}%  ",fontWeight: FontWeight.w600,)
                                ],),


                              ],
                            ),
                          ),

                        // SizedBox(height: 16,),
                        //
                        // Container(decoration: BoxDecoration(color: Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                        //   child: Row(children: [
                        //     Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Afternoon",fontWeight: FontWeight.w600,),)),
                        //     SizedBox(width: 175,),
                        //     Row(spacing: 8,
                        //       children: [
                        //         SmallText(text: "13%",fontWeight: FontWeight.w600,),
                        //         Icon(Icons.check_circle_outline_rounded,size: 16,color: Colors.orange.withOpacity(0.9))
                        //       ],
                        //     )
                        //   ],),
                        // ),
                        //
                        // SizedBox(height: 16,),
                        //
                        // Container(decoration: BoxDecoration(color: Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                        //   child: Row(children: [
                        //     Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Evening",fontWeight: FontWeight.w600,),)),
                        //     SizedBox(width: 45,),
                        //     SmallText(text: "0%",fontWeight: FontWeight.w600,),
                        //   ],),
                        // ),
                        //
                        // SizedBox(height: 16,),
                        //
                        // Container(decoration: BoxDecoration(color: Colors.deepPurpleAccent.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                        //   child: Row(children: [
                        //     Expanded(child: ContainerDecorated(color: Colors.deepPurpleAccent.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Night",fontWeight: FontWeight.w600,),)),
                        //     SizedBox(width: 55,),
                        //     SmallText(text: "63%",fontWeight: FontWeight.w600,)
                        //   ],),
                        // ),
                        //
                        // SizedBox(height: 16,),

                        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                          FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                          SizedBox(width: 8,),
                          Builder(
                            builder: (context) {
                              final totalVotes = controller.list[index].options?.map((o) => o.voteCount).fold(0, (sum, v) => sum + v!.toInt());
                              return SmallText(text: "$totalVotes");
                            }
                          ),
                          SizedBox(width: 30,),
                          Icon(Icons.delete,size: 16,color: Colors.redAccent,),
                          SizedBox(width: 8,),
                          SmallText(text: "Delete",color: Colors.red,fontWeight: FontWeight.w500,)

                        ],),
                        SizedBox(height: 16,),
                        Divider(),
                        SizedBox(height: 16,),
                      ],)



                  ],);
                })
              ),
            ),
          ),
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

