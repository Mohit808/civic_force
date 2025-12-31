import 'package:civic_force/screens/story/controller_main_story.dart';
import 'package:civic_force/screens/story/view_full_story/controller_view_story.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/story_model.dart';
import '../../home/home_screen.dart';
import '../../user_profile/user_profile_screen.dart';

class StoryFullScreenAppBar extends StatelessWidget {
  const StoryFullScreenAppBar({super.key, required this.stories, });
  final Stories stories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0,left: 16),
      child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(spacing: 16,
            children: [
              InkWell(onTap: (){
                Get.back();
              },child: Stack(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,size: 25,),
                  Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                ],
              )),

              InkWell(onTap: (){
                Get.to(()=>UserProfileScreen(userId: stories.user?.userId,name:stories.user?.name,image: stories.user?.image,));
              },
                child: Row(spacing: 8,children: [
                  Image.asset("${stories.user?.image}",errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: 30,width: 30,);},),
                  Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text("${stories.user?.name}", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                    Text(formatDateRelative("${stories.user?.createdAt}"), style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                  ],),
                ],),
              )

            ],
          ),
        ],
      ),
    );
  }
}
