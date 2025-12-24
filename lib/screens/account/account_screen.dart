import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../auth/login/login_screen.dart';
import '../../common_widget/app_bar.dart';
import '../../utils.dart';
import '../add_city_image/add_city_image_screen.dart';
import '../analysis_screen/analysis2_screen.dart';
import '../polls_screen/polls_screen.dart';
import 'my_posts/my_post_screen.dart';
import 'saved_post/saved_post_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      return changeDashboardTab();
    },
      child: Scaffold(
        appBar: AppBarCommon(title: "Account",actions: [
          PopupMenuButton(itemBuilder: (itemBuilder){
            return [
              PopupMenuItem(child: SmallText(text: "Logout")),
              PopupMenuItem(child: SmallText(text: "Delete Account"))
            ];
          })
        ],),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(spacing: 12,children: [

              Column(spacing: 16,children: [
                Stack(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network(userInfo?.image??"https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",height: 80,width: 80,fit: BoxFit.cover,)),
                    Positioned(bottom: 0,right: 0,
                      child: ContainerDecorated(borderRadius: 40,color: Colors.black,
                        child: Row(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.edit,size: 16,color: Colors.white,),
                        ],),
                      ),
                    )
                  ],
                ),
                SmallText(text: "${userInfo?.name}",fontWeight: FontWeight.w600,size: 18,),
              ],),
              SizedBox(height: 16,),

              ContainerDecorated(onTap: (){
                Get.to(()=>AddCityImageScreen());
              },padding: 16,child: Row(spacing: 16,children: [
                Icon(Icons.add_a_photo_outlined),
                Expanded(child: SmallText(text: "Add photos to city and tags to help others explore the city.",fontWeight: FontWeight.w600,)),
                ContainerDecorated(color: AppColors.primary,child: Icon(Icons.arrow_forward,color: Colors.white,size: 16,)),
              ],),),


              Divider(),
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

              Row(spacing: 16,children: [
                ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.priority_high_sharp,size: 24,color: Colors.white,)),
                Expanded(child: SmallText(text: "Privacy",fontWeight: FontWeight.w600,)),
                Icon(Icons.arrow_forward,size: 16,)
              ],),

              Divider(),

              Row(spacing: 16,children: [
                ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.settings,size: 24,color: Colors.white,)),
                Expanded(child: SmallText(text: "Settings",fontWeight: FontWeight.w600,)),
                Icon(Icons.arrow_forward,size: 16,)
              ],),

              Divider(),
              //
              // Row(spacing: 16,children: [
              //   ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.priority_high_sharp,size: 24,color: Colors.white,)),
              //   Expanded(child: SmallText(text: "Terms and conditions",fontWeight: FontWeight.w600,)),
              //   Icon(Icons.arrow_forward,size: 16,)
              // ],),
              //
              // Divider(),

              Row(spacing: 16,children: [
                ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.privacy_tip,size: 24,color: Colors.white,)),
                Expanded(child: SmallText(text: "Terms and Condition",fontWeight: FontWeight.w600,)),
                Icon(Icons.arrow_forward,size: 16,)
              ],),

              // Divider(),
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
