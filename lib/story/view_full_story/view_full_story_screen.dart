import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/text_common.dart';
import '../../model/story_model.dart';
import '../../screens/home/home_screen.dart';
import '../../utils/app_images.dart';
import 'controller_view_story.dart';

class ViewFullStoryScreen extends StatelessWidget {

  final List<Stories>? listStory;
  final List<Stories>? listMyStory;
  final int indexx;

  const ViewFullStoryScreen({super.key,this.listStory, this.listMyStory, required this.indexx});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerViewStory(listStory: listStory,listMyStory: listMyStory,indexx: indexx),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Center(child: Image.network("$src")),

              if(listStory!=null && listStory!.isNotEmpty)PageView.builder(controller: controller.pageController,onPageChanged: (value){
                controller.selectedIndex=value;
                controller.startProgressTimer();
                controller.update();

                if(listStory!.isNotEmpty && listStory?[controller.selectedIndex].viewed==null)controller.postData(listStory?[controller.selectedIndex].id);

              },itemCount: listStory?.length??0,itemBuilder: (itemBuilder,index){
                return Stack(
                  children: [
                    Center(child: Image.network("${listStory?[index].mediaUrl}",errorBuilder: (a,b,c)=>Image.asset(AppImages.user),)),
                    Positioned(bottom: 36,left: 0,right: 0,
                      child: Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,spacing: 8,
                        children: [
                          Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                          SmallText(text: "${listStory![index].viewCount??'0'}",color: Colors.white,size: 16,fontWeight: FontWeight.w600,),
                        ],
                      ),
                    )
                  ],
                );
              }),

              if(listMyStory!=null && listMyStory!.isNotEmpty)PageView.builder(controller: controller.pageController,onPageChanged: (value){
                controller.selectedIndex=value;
                controller.startProgressTimer();
                controller.update();
                if(listMyStory!.isNotEmpty && listMyStory?[controller.selectedIndex].viewed==null )controller.postData(listMyStory?[controller.selectedIndex].id);
              },itemCount: listMyStory?.length??0,itemBuilder: (itemBuilder,index){
                return Stack(
                  children: [
                    Center(child: Image.network("${listMyStory?[index].mediaUrl}",errorBuilder: (a,b,c)=>Image.asset(AppImages.user),)),

                    Positioned(bottom: 36,left: 0,right: 0,
                      child: Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,spacing: 8,
                        children: [
                          Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                          SmallText(text: "${listMyStory![index].viewCount??'0'}",color: Colors.white,size: 16,fontWeight: FontWeight.w600,),
                        ],
                      ),
                    )
                  ],
                );
              }),


              if(listMyStory!=null && listMyStory!.isNotEmpty)Padding(
                padding: const EdgeInsets.only(top: 55.0,left: 16),
                child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(spacing: 4,children: [
                    //   for(var x in listMyStory??[])
                    //     Expanded(child: ContainerDecorated(height: 4)),
                    // ],),

                    Row(children: List.generate(listMyStory?.length ?? 0, (x) {
                      return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: x < controller.selectedIndex ? Colors.green : Color(0xFFBAB8B8),borderRadius: BorderRadius.circular(4),),
                        child:
                        x == controller.selectedIndex
                            ? FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: controller.progress, child: Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4),),),)
                            : null,
                      ),);
                    },),),

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
                          // Get.to(()=>UserDetailsScreen(navigateOnMessage: true,id: listMyStory![controller.selectedIndex].user?.userId,name: listMyStory![controller.selectedIndex].user?.name,image: listMyStory![controller.selectedIndex].user?.image,));
                          Get.to(()=>UserProfileScreen());
                        },
                          child: Row(spacing: 8,children: [
                            Image.asset("${listMyStory![controller.selectedIndex].user?.image}",errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: 30,width: 30,);},),
                            Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
                              // SmallText(text: "${listMyStory![controller.selectedIndex].user?.name}",color: Colors.white,size: 14,fontWeight: FontWeight.w500,),
                              // SmallText(text: formatDateRelative(listMyStory![controller.selectedIndex].createdAt),color: Colors.white70,fontWeight: FontWeight.w500,size: 11,),

                              Text("${listMyStory![controller.selectedIndex].user?.name}", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                              Text(formatDateRelative(listMyStory![controller.selectedIndex].createdAt), style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),


                            ],),
                          ],),
                        )

                      ],
                    ),
                  ],
                ),
              ),





              if(listStory!=null && listStory!.isNotEmpty)Padding(
                padding: const EdgeInsets.only(top: 55.0,left: 16),
                child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(spacing: 4,children: [
                    //   for(var x in List.generate(listStory?.length??0, (index){return index;}))
                    //     Expanded(child: ContainerDecorated(height: 4,color: x<controller.selectedIndex?Colors.green:null,)),
                    // ],),


                    Row(children: List.generate(listStory?.length ?? 0, (x) {
                          return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(color: x < controller.selectedIndex ? Colors.green : Color(0xFFBAB8B8),borderRadius: BorderRadius.circular(4),),
                              child:
                              x == controller.selectedIndex
                                  ? FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: controller.progress, child: Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4),),),)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),




                    ///////////

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
                         Get.to(()=>UserProfileScreen());
                         // Get.to(()=>UserDetailsScreen(navigateOnMessage: true,id: listStory![controller.selectedIndex].user?.userId,name: listStory![controller.selectedIndex].user?.name,image: listStory![controller.selectedIndex].user?.image,));
                       },
                         child: Row(spacing: 8,children: [
                           Image.asset("${listStory![controller.selectedIndex].user?.image}",errorBuilder: (a,b,c){return Image.asset(AppImages.user,height: 30,width: 30,);},),
                           Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
                             Text("${listStory![controller.selectedIndex].user?.name}", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),
                             Text(formatDateRelative(listStory![controller.selectedIndex].createdAt), style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black54,),],),),

                           ],),
                         ],),
                       )

                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
