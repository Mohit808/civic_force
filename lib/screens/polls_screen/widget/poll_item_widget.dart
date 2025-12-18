import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common_widget/app_colors.dart';
import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/text_common.dart';
import 'package:civic_force/model/poll_model.dart';

import '../../../utils.dart';
import '../polls_screen.dart';
import 'controller_post_item.dart';

class PollItemWidget extends StatelessWidget {
  const PollItemWidget({super.key, required this.data, this.onDeleteClick, this.onVote});
  final Data? data;
  final Function()? onDeleteClick;
  final Function()? onVote;

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(init: ControllerPostItem(onDeleteClick: onDeleteClick,onVote: onVote),
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          SmallText(text: "${data?.question}",fontWeight: FontWeight.w600,size: 20,),
          SizedBox(height: 8,),
          Row(
            children: [
              SmallText(text: "Asked by ", color: Colors.black54,),
              SmallText(text: (data?.user?.userId==userInfo?.userId)?"You":  data?.user?.name??"Anonymous",fontWeight: FontWeight.w500,),
              SmallText(text: " about ${timeAgo(data?.createdAt)}",color: Colors.black54,),
            ],
          ),
          SizedBox(height: 36,),

          if(data?.options!=null && data?.hasVoted!=true)Column(spacing: 16,children: [
            for(var x in data!.options!)
              ContainerDecorated(onTap: (){
                controller.selectedRadio=x.id;
                controller.update();
                // controller.postVote(pollOptionId: x.id);
              },color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
                SizedBox(height: 20,width: 20,child: Radio(value: controller.selectedRadio, groupValue: x.id, onChanged: (value){})),
                SmallText(text: "${x.text}",fontWeight: FontWeight.w600,)
              ],),),

            SizedBox(),

            if(controller.selectedRadio!=null &&  data?.options!=null && data!.options!.any((test)=>test.id==controller.selectedRadio))Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              ContainerDecorated(onTap: (){
                controller.postVote(pollOptionId: controller.selectedRadio);
              },borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 12),color: AppColors.primary,child: SmallText(text: "Submit your vote",color: Colors.white,fontWeight: FontWeight.w600,)),
            ],),
            // SizedBox(height: 16,)
            // SizedBox(height: 24,),
            // Divider(height: 36,)
          ],),


          if(data?.options!=null && data?.hasVoted==true)
            Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,children: [

              for (var x in data!.options!)
                Container(decoration: BoxDecoration(color:  x.isWinner==true?Colors.deepPurple.withOpacity(0.03): Color(0xFFFFF8F1),borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Row(children: [

                        Expanded(flex: x.percentage!.round().clamp(0, 100), child: ContainerDecorated( padding: 16,color: x.isWinner==true?Colors.deepPurpleAccent.withOpacity(0.3): Colors.orange.withOpacity(0.15), borderRadius: 30,child:  SmallText(text: "1",fontWeight: FontWeight.w600,color: Colors.transparent,),),),

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

              Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                SizedBox(width: 8,),
                Builder(
                    builder: (context) {
                      final totalVotes = data?.options?.map((o) => o.voteCount).fold(0, (sum, v) => sum + v!.toInt());
                      return SmallText(text: "$totalVotes");
                    }
                ),

                if("${data?.user?.userId}"=="${userInfo?.userId}")
                  controller.loadingDelete?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                  InkWell(onTap: (){
                    controller.deletePoll(data?.id);
                  }, child: Row(children: [
                    SizedBox(width: 30,),
                    Icon(Icons.delete,size: 16,color: Colors.redAccent,),
                    SizedBox(width: 8,),
                    SmallText(text: "Delete",color: Colors.red,fontWeight: FontWeight.w500,)
                  ],),
                  )

              ],),
              // SizedBox(height: 16,),
              // Divider(),
              // SizedBox(height: 16,),
            ],)



        ],);
      }
    );
  }
}
