import 'dart:ui';

import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_widgets/loading_widget.dart';
import 'package:civic_force/network_handling/network_widgets/no_data_widget.dart';
import 'package:civic_force/network_handling/network_widgets/something_went_wrong_widget.dart';
import 'package:civic_force/screens/home/controller_home.dart';
import 'package:civic_force/story/story_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/app_colors.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/network_image_widget.dart';
import '../../common_widget/text_common.dart';
import '../comment_screen/comment_screen.dart';
import '../user_profile/user_profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerHome(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarCommon(title: "",height: 0,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalHeadingText(text: "Story",letterSpacing: 2,),
                    SizedBox(height: 8,),
                    StoryMainWidget(),
                    SizedBox(height: 16,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalHeadingText(text: "Feed",letterSpacing: 2,),
                        SizedBox(height: 16,
                          child: PopupMenuButton(onSelected: (value){
                            // controller.changeLayout();
                          },iconSize: 16,itemBuilder: (BuildContext context) { return [
                            PopupMenuItem(value: "value",child: SmallText(text: "Change layout",),)
                          ]; },),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,):
                    controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,):
                    controller.list.isEmpty?NoDataWidget():

                    ListView.builder(shrinkWrap: true,itemCount: controller.list.length,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,top: 8),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              controller.layoutChanged?SizedBox():SizedBox(height: 40,width: 40,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                              controller.layoutChanged?SizedBox():SizedBox(width: 16,),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Row(
                                    children: [
                                      InkWell(onTap: (){
                                        Get.to(()=>UserProfileScreen());
                                      },
                                        child: Row(
                                          children: [
                                            !controller.layoutChanged?SizedBox(): SizedBox(height: 24,width: 24,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                                            !controller.layoutChanged?SizedBox(): SizedBox(width: 8,),
                                            SmallText(text: "Ivan Brennan",fontWeight: FontWeight.w700,letterSpacing: 0.3,),
                                            SizedBox(width: 16,),
                                            ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black54,),
                                            SizedBox(width: 8,),
                                            SmallText(text: formatDateRelative(controller.list[index].createdAt),color: Colors.black54,size: 11,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 4,),
                                  if(controller.list[index].text!=null&&controller.list[index].text!.isNotEmpty)SmallText(text: controller.list[index].text??""),
                                  if(controller.list[index].image!=null && controller.list[index].image!.isNotEmpty)Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                    child:
                                      GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount: controller.list[index].image!.split(",").length==1?1:2,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: controller.list[index].image!.split(",").length,mainAxisSpacing: 8,crossAxisSpacing: 8,childAspectRatio: 1), itemBuilder: (itemBuilder,indexXX){
                                        return ImageCommon(src: controller.list[index].image!.split(",")[indexXX],fit: BoxFit.cover,borderRadius: 15,);
                                      }),
                                    // SizedBox(width: double.infinity,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(src: controller.list[index].image?.split(",").first??"https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                                  ),
                                  SizedBox(height: 8,),
                                  Row(children: [

                                    controller.indexLoadingLike==index ?
                                    SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)) :InkWell(onTap: (){
                                      controller.likePost(index: index);
                                    }, child: Row(children: [
                                      FaIcon(controller.list[index].isLiked==true? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,size: 16,color: controller.list[index].isLiked==true?Colors.red:Colors.black54,),
                                      SizedBox(width: 8,),
                                      SmallText(text: "${controller.list[index].likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),
                                    ],),),

                                    Spacer(),
                                    FaIcon(FontAwesomeIcons.retweet,size: 16,color: Colors.black54,),
                                    SizedBox(width: 8,),
                                    SmallText(text: "${controller.list[index].retweetCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


                                    Spacer(),
                                    InkWell(onTap: (){
                                      Get.to(()=>CommentScreen(postId: controller.list[index].id,));
                                    },child: FaIcon(FontAwesomeIcons.commentDots,size: 16,color: Colors.black54,)),
                                    SizedBox(width: 8,),
                                    SmallText(text: "${controller.list[index].likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


                                    Spacer(),
                                    FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                                    SizedBox(width: 8,),
                                    SmallText(text: "${controller.list[index].likesCount??"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


                                    Spacer(),
                                    controller.apiResponseSavedPost.status==Status.LOADING && controller.indexLoadingSaved==index?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                                    InkWell(onTap: (){
                                      controller.postSavedPost(index: index);
                                    },child: FaIcon(controller.list[index].isSaved==true?FontAwesomeIcons.solidBookmark: FontAwesomeIcons.bookmark,size: 14,color: controller.list[index].isSaved==true?Colors.red:Colors.black54,)),
                                    SizedBox(width: 16,),
                                    // SmallText(text: "Saved",fontWeight: FontWeight.w600,color: Colors.black54,),

                                    SizedBox(width: 16,),
                                    // Spacer(),
                                    FaIcon(FontAwesomeIcons.shareFromSquare,size: 16,color: Colors.black54,),
                                    // SizedBox(width: 8,),
                                    // SmallText(text: "Share",fontWeight: FontWeight.w600,color: Colors.black54,),
                                  ],)
                                ],),
                              )
                            ],),
                          ),
                          Divider()
                        ],
                      );
                    }),

                    SizedBox(height: 24,),
                    Row(children: [
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          SmallText(text: "Heard by city",fontWeight: FontWeight.w600,size: 16,),
                          SmallText(text: "City wise data",color: Colors.black54,),
                        ],),
                      ),
                      SmallText(text: "View All >",fontWeight: FontWeight.w800,textDecoration: TextDecoration.underline,)
                    ],),

                    SizedBox(height: 24,),

                    // Row(
                    //   children: [
                    //     Expanded(child: SmallText(text: "Prayagraj",fontWeight: FontWeight.w600,size: 14,)),
                    //     SmallText(text: "Next City",fontWeight: FontWeight.w600,size: 14,),
                    //   ],
                    // ),
                    // SizedBox(height: 8,),
                    SizedBox(height: 150,
                      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(spacing: 8,children: [

                          Stack(
                            children: [
                              SizedBox(height: 150,width: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/a1/8e/3b/a18e3b651fc065c5040f09108955430f.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                              Positioned(bottom: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(height: 35,width: 150,
                                      color: Colors.black.withOpacity(0.1),
                                      padding: EdgeInsets.only(top: 8,left: 8),
                                      child: SmallText(text: "Prayagraj",color: Colors.white,fontWeight: FontWeight.w700,size: 13,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(spacing: 8,
                            children: [
                              Row(spacing: 8,
                                children: [
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/b0/55/af/b055afbd910458f46eae8b141f48532f.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/60/46/85/60468533b11c463694895c6e7003af14.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/eb/79/35/eb7935eb385628f9d1cefbd7c77e1202.jpg",fit: BoxFit.cover,borderRadius: 10,),),

                                ],
                              ),
                              Row(spacing: 8,
                                children: [
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/1200x/75/10/18/751018d0e55d0409cc1ff8880d34a95e.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/6e/91/55/6e91555d191d09d92ee2ef949d8e9089.jpg",fit: BoxFit.cover,borderRadius: 10,),),
                                  SizedBox(height: 70,width: 70,child: ImageCommon(src: "https://i.pinimg.com/736x/b3/ad/3b/b3ad3bacde1436e5860fa06e21d5db79.jpg",fit: BoxFit.cover,borderRadius: 10,),),

                                ],
                              ),
                            ],
                          ),
                          // SizedBox(width: 8,),
                          Row(
                            children: [
                              Icon(Icons.arrow_right,color: Colors.blue,),
                              SmallText(text: "See All",fontWeight: FontWeight.w600,color: Colors.blue,),
                            ],
                          )

                        ],),
                      ),
                    ),

                    SizedBox(height: 48,),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}



String formatDateRelative(String? isoUtc) {
  if (isoUtc == null || isoUtc.trim().isEmpty) return "";

  DateTime dtUtc;
  try {
    dtUtc = DateTime.parse(isoUtc);
  } catch (e) {
    return isoUtc;
  }

  // convert to local time
  final DateTime dtLocal = dtUtc.toLocal();

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateOnly = DateTime(dtLocal.year, dtLocal.month, dtLocal.day);

  String formatTime(DateTime dt) {
    int hour = dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = hour >= 12 ? 'PM' : 'AM';
    if (hour == 0) {
      hour = 12; // Midnight
    } else if (hour > 12) {
      hour -= 12;
    }
    return '$hour:$minute $ampm';
  }

  final timeString = formatTime(dtLocal);

  if (dateOnly == today) return timeString;
  if (dateOnly == today.subtract(const Duration(days: 1))) return 'Yesterday';

  // fallback for other dates
  String two(int n) => n.toString().padLeft(2, '0');
  final day = two(dtLocal.day);
  final month = two(dtLocal.month);
  final year = two(dtLocal.year % 100);

  return '$day/$month/$year';
}