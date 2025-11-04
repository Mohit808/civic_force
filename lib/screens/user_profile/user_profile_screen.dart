import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/user_profile/controller_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerUserProfile(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Fons Mans",color: AppColors.scaffoldBackgroundColor,colorIconTheme: AppColors.primary,titleColor: AppColors.primary,centerTitle: false,actions: [Icon(Icons.more_vert),SizedBox(width: 8,)],),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 16,),
              SizedBox(height: 100,width: 100,child: ImageCommon(src: "https://i.pinimg.com/1200x/f0/38/38/f038383985e6289f4c208150818e01ab.jpg",fit: BoxFit.cover,borderRadius: 50),),
              SizedBox(height: 8,),
              SmallText(text: "Fons Mans",fontWeight: FontWeight.w600,size: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(spacing: 2,children: [
                        SmallText(text: "100",fontWeight: FontWeight.w600,),
                        SmallText(text: "Posts",size: 11,color: Colors.black54,),
                      ],),
                    ),
                    Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 2,children: [
                        SmallText(text: "294K",fontWeight: FontWeight.w600,),
                        SmallText(text: "Followers",size: 11,color: Colors.black54,),
                      ],),
                    ),
                    Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,spacing: 2,children: [
                        SmallText(text: "100",fontWeight: FontWeight.w600,),
                        SmallText(text: "Following",size: 11,color: Colors.black54,),
                      ],),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(spacing: 16,
                  children: [
                    Expanded(child: ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Follow",textAlign: TextAlign.center,fontWeight: FontWeight.w600,),),),
                    Expanded(child: ContainerDecorated(color: Colors.black,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Message",textAlign: TextAlign.center,color: Colors.white,),),),
                  ],
                ),
              ),

              SizedBox(height: 48,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(spacing: 16,
                  children: [
                    Expanded(child: InkWell(onTap: (){
                      controller.selectedTab=0;
                      controller.update();
                    },
                      child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            Row(spacing: 4,children: [
                              Icon(Icons.border_all_rounded,size: 16,),
                              SmallText(text: "All",fontWeight: FontWeight.w600,)
                            ],),
                            SizedBox(height: 4,),
                            Container(height: 2,width: 45,decoration: BoxDecoration(color: controller.selectedTab==0?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                          ],)
                        ],
                      ),
                    )),
                    Expanded(child: InkWell(onTap: (){
                      controller.selectedTab=1;
                      controller.update();
                    },
                      child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            Row(spacing: 4,children: [
                              Icon(Icons.perm_media_outlined,size: 16,),
                              SmallText(text: "Media",fontWeight: FontWeight.w600,)
                            ],),
                            SizedBox(height: 4,),
                            Container(height: 2,width: 60,decoration: BoxDecoration(color: controller.selectedTab==1?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                          ],)
                        ],
                      ),
                    )),
                    Expanded(child: InkWell(onTap: (){
                      controller.selectedTab=2;
                      controller.update();
                    },
                      child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.alternate_email,size: 16,),
                          // SmallText(text: "alternate_email",fontWeight: FontWeight.w600,)
                          Column(children: [
                            Row(spacing: 4,children: [
                              Icon(Icons.alternate_email,size: 16,),
                              SmallText(text: "Tag",fontWeight: FontWeight.w600,)
                            ],),
                            SizedBox(height: 4,),
                            Container(height: 2,width: 45,decoration: BoxDecoration(color: controller.selectedTab==2?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                          ],)
                        ],
                      ),
                    )),

                  ],
                ),
              ),

              if(controller.selectedTab==0)allData(),
              if(controller.selectedTab==1)gridData(),


              SizedBox(height: 40,)
            ],),
          ),
        );
      }
    );
  }

  allData(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Row(
          children: [
            InkWell(onTap: (){
              Get.to(()=>UserProfileScreen());
            },
              child: Row(
                children: [
                  SizedBox(height: 24,width: 24,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                  SizedBox(width: 8,),
                  SmallText(text: "Ivan Brennan",fontWeight: FontWeight.w700,letterSpacing: 0.3,),
                ],
              ),
            ),
            SizedBox(width: 16,),
            ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black54,),
            SizedBox(width: 8,),
            SmallText(text: "2m",color: Colors.black54,),
          ],
        ),
        SizedBox(height: 4,),
        SmallText(text: "eraeaaf"),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 8),
          child: SizedBox(width: double.infinity,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
        ),
        SizedBox(height: 8,),
        Row(children: [
          FaIcon(FontAwesomeIcons.heart,size: 16,color: Colors.black54,),
          SizedBox(width: 8,),
          SmallText(text: "${"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),

          Spacer(),
          FaIcon(FontAwesomeIcons.retweet,size: 16,color: Colors.black54,),
          SizedBox(width: 8,),
          SmallText(text: "${"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


          Spacer(),
          FaIcon(FontAwesomeIcons.commentDots,size: 16,color: Colors.black54,),
          SizedBox(width: 8,),
          SmallText(text: "${"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


          Spacer(),
          FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
          SizedBox(width: 8,),
          SmallText(text: "${"0"}",fontWeight: FontWeight.w600,color: Colors.black54,),


          Spacer(),
          FaIcon(FontAwesomeIcons.bookmark,size: 14,color: Colors.black54,),
          SizedBox(width: 16,),
          // SmallText(text: "Saved",fontWeight: FontWeight.w600,color: Colors.black54,),

          SizedBox(width: 16,),
          // Spacer(),
          FaIcon(FontAwesomeIcons.shareFromSquare,size: 16,color: Colors.black54,),
          // SizedBox(width: 8,),
          // SmallText(text: "Share",fontWeight: FontWeight.w600,color: Colors.black54,),
        ],)
      ],),
    );

  }

  gridData(){
    return Column(children: [
      Row(spacing: 4,children: [
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/c0/98/4b/c0984bd4779ff9634f9d707ec6ad0f5b.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/3d/01/f1/3d01f126c608d7555c8a99f3163421f7.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/49/e2/4c/49e24cb0657ca40c77e8c6a6831b6af5.jpg",fit: BoxFit.cover,borderRadius: 10,),)),

      ],),
      SizedBox(height: 4,),
      Row(spacing: 4,children: [
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/00/a9/53/00a953273a1313f54350c7ee3e47fff4.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/62/31/41/623141fbb390209c9effd334a51db2b5.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/61/2b/3a/612b3aa25e0c4fd49180b116934565fd.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
      ],),
      SizedBox(height: 4,),
      Row(spacing: 4,children: [
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/4d/82/5a/4d825a0ea3706c2f60bce25526ebe31d.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/c1/51/b1/c151b141f2d7169dcdacb5b9a1a86964.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/63/95/01/639501272f8a350415fac4d7b78014ab.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
      ],),
      SizedBox(height: 4,),
      Row(spacing: 4,children: [
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/1200x/5d/00/2e/5d002e8845ef4ad052b5b6432c87a2fa.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/68/3b/50/683b50b794d06988e57e6b8a3a63bd1e.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
        Expanded(child: SizedBox(height: 150,child: ImageCommon(src: "https://i.pinimg.com/736x/9d/2a/6e/9d2a6e386f606e7f8198fc87e4af5c44.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
      ],),
    ],);
  }
}
