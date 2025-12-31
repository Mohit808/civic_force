import 'package:flutter/material.dart';

import '../../../common_widget/text_common.dart';
import '../../../model/story_model.dart';
import '../../../utils/app_images.dart';
import 'story_full_screen_app_bar.dart';

class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget({super.key, required this.stories});
  final Stories stories;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: InkWell(onTap: (){
          // controller.nextStory();
        },child: Image.network("${stories.mediaUrl}",errorBuilder: (a,b,c)=>Image.asset(AppImages.user),))),
        Positioned(bottom: 36,left: 0,right: 0,
          child: Column(
            children: [
              if(stories.text!=null && "${stories.text}".isNotEmpty)Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmallText(text: "${stories.text}",color: Colors.white,textAlign: TextAlign.center,),
              ),
              Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,spacing: 8,
                children: [
                  Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                  SmallText(text: "${stories.viewCount??'0'}",color: Colors.white,size: 16,fontWeight: FontWeight.w600,),
                ],
              ),
            ],
          ),
        ),

        StoryFullScreenAppBar(stories: stories,)
      ],
    );
  }
}
