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
import '../../../custom_widgets/full_screen_image.dart';
import '../../../data_source/data_source_common.dart';
import '../../../network_handling/api_response.dart';
import '../../../screens/comment_screen/comment_screen.dart';
import '../../../screens/home/home_screen.dart';
import '../../../screens/polls_screen/widget/poll_item_widget.dart';
import '../../../screens/user_profile/user_profile_screen.dart';
import '../../short_mode/short_mode_screen.dart';
import '../controller_post_list.dart';
import 'controller_post_item.dart';
import 'widget/post_action_bar.dart';

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
                return InkWell(onTap: (){
                  // Get.to(()=>FullScreenImage(src: data.image,));
                  Get.to(()=>ShortModeScreen(src: data.image,));
                },child: ImageCommon( data.image!.split(",")[indexXX],borderRadius: 15,));
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
            if(hideRetweet!=true)PostActionBar(data: data),
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
