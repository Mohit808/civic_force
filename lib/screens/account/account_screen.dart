import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../auth/login/login_screen.dart';
import '../../common_widget/app_bar.dart';
import '../../project_modules/mobile/mobile_dialog.dart';
import '../../utils.dart';
import '../add_city_image/add_city_image_screen.dart';
import '../analysis_screen/analysis2_screen.dart';
import '../polls_screen/polls_screen.dart';
import 'feedback/feedback_screen.dart';
import 'language/app_language_screen.dart';
import 'my_posts/my_post_screen.dart';
import 'privacy/privacy_screen.dart';
import 'report_problem/report_problem_screen.dart';
import 'saved_post/saved_post_screen.dart';
import 'settings/settings_screen.dart';
import 'terms_and_condition/terms_and_conditions_screen.dart' show TermsAndConditionsScreen;

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return WillPopScope(onWillPop: ()async{
      return changeDashboardTab();
    },
      child: Scaffold(
        appBar: AppBarCommon(title: "Account",actions: [
          // PopupMenuButton(itemBuilder: (itemBuilder){
          //   return [
          //     PopupMenuItem(child: SmallText(text: "Logout")),
          //   ];
          // })
        ],),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(spacing: 12,children: [

              Column(children: [
                Stack(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageCommon(userInfo?.image??"https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",sizeAndCircle: 100,)),
                    Positioned(bottom: 4,right: 4,
                      child: ContainerDecorated(borderRadius: 40,color: Colors.black,
                        child: Row(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.edit,size: 16,color: Colors.white,),
                        ],),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                InkWell(onTap: (){
                  Get.to(()=>UserProfileScreen(userId: userInfo?.userId,name: userInfo?.name,image: userInfo?.image,));
                },
                  child: Row(mainAxisSize: MainAxisSize.min,spacing: 8,
                    children: [
                      SmallText(text: "${userInfo?.name}",fontWeight: FontWeight.w600,size: 18,),
                      Icon(Icons.open_in_new_rounded,size: 16,color: Colors.green,),
                    ],
                  ),
                ),
                SizedBox(height: 4,),
                SmallText(text: "${userInfo?.email??userInfo?.phoneNumber}",color: Colors.black54,),
                SizedBox(height: 4,),

                ContainerDecorated(marginEdgeInsets: EdgeInsets.only(top: 8),paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12,vertical: 6),borderRadius: 30,colorBorder: Colors.green.shade200,color: Colors.transparent,onTap: (){
                  showDialog(context: Get.context!, builder: (builder){
                    return Dialog(child: MobileDialog(),);
                  });
                },child: Row(spacing: 8,mainAxisSize: MainAxisSize.min,children: [
                  Icon(Icons.add,size: 16,color: Colors.green,),
                  SmallText(text: "Add mobile number",color: Colors.green,fontWeight: FontWeight.w500,)
                ],),),
                
                // ContainerDecorated(onTap: (){
                //   Get.to(()=>UserProfileScreen(userId: userInfo?.userId,name: userInfo?.name,image: userInfo?.image,));
                // },color: Colors.transparent,colorBorder: Colors.green,borderRadius: 30,
                //   child: Row(spacing: 4,mainAxisSize: MainAxisSize.min,
                //     children: [
                //       SmallText(text: " View account",size: 12,color: Colors.green),
                //       Icon(Icons.north_east,size: 16,color: Colors.green,)
                //     ],
                //   ),
                // )
              ],),

              SizedBox(height: 16,),

              ContainerDecorated(colorBorder: Colors.grey.shade300,color: Colors.transparent,onTap: (){
                Get.to(()=>AddCityImageScreen());
              },padding: 16,child: Row(spacing: 16,children: [
                Icon(Icons.add_a_photo_outlined),
                Expanded(child: SmallText(text: "Add photos to city and tags to help others explore the city.",fontWeight: FontWeight.w600,)),
                ContainerDecorated(color: AppColors.primary,child: Icon(Icons.arrow_forward,color: Colors.white,size: 16,)),
              ],),),

              SizedBox(),
              Row(
                children: [
                  SmallText(text: "Profile",fontWeight: FontWeight.w500,size: 18,),
                ],
              ),
              SizedBox(),

              InkWell(onTap: (){
                Get.to(()=>MyPostScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.panorama_rounded,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "My Posts",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),


              Divider(),

              InkWell(onTap: (){
                Get.to(()=>PollsScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.poll_sharp,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "My Polls",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                Get.to(()=>SavedPostScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.bookmark_added,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Saved",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                Get.to(()=>PrivacyScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.priority_high_sharp,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Privacy",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                Get.to(()=>SettingsScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.settings,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Settings",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),





              SizedBox(height: 16,),
              Row(
                children: [
                  SmallText(text: "Legal",fontWeight: FontWeight.w500,size: 18,),
                ],
              ),
              SizedBox(),

              // Divider(),
              //
              // Row(spacing: 16,children: [
              //   ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.priority_high_sharp,size: 24,color: Colors.white,)),
              //   Expanded(child: SmallText(text: "Terms and conditions",fontWeight: FontWeight.w600,)),
              //   Icon(Icons.arrow_forward,size: 16,)
              // ],),
              //
              // Divider(),

              InkWell(onTap: (){
                Get.to(()=>ReportProblemScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.bug_report_outlined,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Report a problem",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),
              Divider(),

              InkWell(onTap: (){
                Get.to(()=>TermsAndConditionsScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.privacy_tip,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Terms and Condition",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),


              Divider(),

              InkWell(onTap: (){
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.live_help_outlined,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "FAQ's",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                Get.to(()=>FeedbackScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.question_answer,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Feedback",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),


              SizedBox(height: 16,),
              Row(
                children: [
                  SmallText(text: "General",fontWeight: FontWeight.w500,size: 18,),
                ],
              ),
              SizedBox(),


              InkWell(onTap: (){
                Get.to(()=>AppLanguageScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.translate_rounded,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Language",fontWeight: FontWeight.w600,)),
                  Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                // Get.to(()=>AppLanguageScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.person_add_outlined,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "Invite friends",fontWeight: FontWeight.w600,)),
                  // Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),

              Divider(),

              InkWell(onTap: (){
                // Get.to(()=>AppLanguageScreen());
              },
                child: Row(spacing: 16,children: [
                  ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.update,size: 24,color: Colors.white,)),
                  Expanded(child: SmallText(text: "App updates",fontWeight: FontWeight.w600,)),
                  // Icon(Icons.arrow_forward,size: 16,)
                ],),
              ),


              //
              // Row(spacing: 16,children: [
              //   ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.info,size: 24,color: Colors.white,)),
              //   Expanded(child: SmallText(text: "About us",fontWeight: FontWeight.w600,)),
              //   Icon(Icons.arrow_forward,size: 16,)
              // ],),

              SizedBox(height: 16,),

              ContainerDecorated(onTap: () async {
                try{
                  showDialog(context: context, builder: (builder){
                    return Dialog(backgroundColor: Color(0xFF424142),child: Padding(
                      padding: const EdgeInsets.all( 16.0),
                      child: Column(mainAxisSize: MainAxisSize.min, spacing: 16,
                        children: [
                          SmallText(text: "You are now logging out".tr,size: 11,color: Colors.white60,),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),);
                  });
                  // var ltLg=box.read(Utils.latLng);
                  box.erase();
                  token="";
                  sharedPreferences.clear();
                  await sharedPreferences.reload();
                  await FirebaseMessaging.instance.deleteToken();
                  // box.write(Utils.intro,true);
                  // box.write(Utils.latLng,ltLg);

                }catch(e){}
                Get.back();
                Get.offAll(()=>LoginScreen());
              },padding: 12,colorBorder: Colors.grey.shade300,
                child: Row(spacing: 16,mainAxisAlignment: MainAxisAlignment.center,children: [
                  Icon(Icons.exit_to_app_rounded,size: 16,),
                  SmallText(text: "Logout",fontWeight: FontWeight.w600,)
                ],),
              ),

              SizedBox(height: 16,),


              FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, asyncSnapshot) {
                  return SmallText(text: "version : ${asyncSnapshot.data?.version}:${asyncSnapshot.data?.buildNumber}");
                }
              ),

              SizedBox(height: 16,),


            ],),
          ),
        ),
      ),
    );
  }
}
