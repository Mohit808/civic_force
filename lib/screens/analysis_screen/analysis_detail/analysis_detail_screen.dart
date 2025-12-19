import 'dart:ui';

import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/controller_analysis_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../city/city_screen.dart';

class AnalysisDetailScreen extends StatelessWidget {
  const AnalysisDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAnalysisDetail(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: SmallText(text: "#Road",size: 20,)),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
              SmallText(text: "Reported in 15 cities",fontWeight: FontWeight.w600,size: 16,),
              SizedBox(height: 16),

              Row(spacing: 8,
                children: [
                  Expanded(child: ContainerDecorated(onTap: (){
                    Get.to(()=>CityScreen());
                  },padding: 0,height: 190,child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(child: ImageCommon(src: "https://i.pinimg.com/736x/e6/db/22/e6db22d8dc84cd25b5977292bc5ac2a0.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                        ],
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.1),
                                      padding: EdgeInsets.only(top: 8,left: 8,bottom: 8),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                        children: [
                                          SmallText(text: "Prayagraj",color: Colors.white,fontWeight: FontWeight.w700,),
                                          SmallText(text: "Most 3.2K cases",color: Colors.white,size: 12,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),)),
                  Expanded(child: Column(spacing: 8,
                    children: [
                      Row(spacing: 8,
                        children: [
                          Expanded(child: ContainerDecorated(padding: 0,height: 90,child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: ImageCommon(src: "https://i.pinimg.com/736x/3c/60/dd/3c60dd8a93f3abc9bd796927bc34b5f2.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                            child: Container(
                                              color: Colors.black.withOpacity(0.1),
                                              padding: EdgeInsets.only(top: 4,left: 8,bottom: 4),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                                children: [
                                                  SmallText(text: "Delhi",color: Colors.white,fontWeight: FontWeight.w700,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),)),
                          Expanded(child: ContainerDecorated(padding: 0,height: 90,child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: ImageCommon(src: "https://i.pinimg.com/1200x/7f/48/b5/7f48b5e5d5e70dd70a6f8b01ac8bd354.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                            child: Container(
                                              color: Colors.black.withOpacity(0.1),
                                              padding: EdgeInsets.only(top: 4,left: 8,bottom: 4),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                                children: [
                                                  SmallText(text: "London",color: Colors.white,fontWeight: FontWeight.w700,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),)),

                          // Expanded(child: ContainerDecorated(padding: 0,height: 90,child: ImageCommon(src: "https://i.pinimg.com/736x/3c/60/dd/3c60dd8a93f3abc9bd796927bc34b5f2.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
                          // Expanded(child: ContainerDecorated(padding: 0,height: 90,child: ImageCommon(src: "https://i.pinimg.com/1200x/7f/48/b5/7f48b5e5d5e70dd70a6f8b01ac8bd354.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
                        ],
                      ),
                      Row(spacing: 8,
                        children: [
                          Expanded(child: ContainerDecorated(padding: 0,height: 90,child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: ImageCommon(src: "https://i.pinimg.com/736x/32/d1/9f/32d19f4783418484ef25f29d197992da.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                            child: Container(
                                              color: Colors.black.withOpacity(0.1),
                                              padding: EdgeInsets.only(top: 4,left: 8,bottom: 4),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                                children: [
                                                  SmallText(text: "Mumbai",color: Colors.white,fontWeight: FontWeight.w700,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),)),
                          Expanded(child: ContainerDecorated(padding: 0,height: 90,child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: ImageCommon(src: "https://i.pinimg.com/736x/72/ca/0a/72ca0a0637fe9cfe884524ac94c48086.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                            child: Container(
                                              color: Colors.black.withOpacity(0.1),
                                              padding: EdgeInsets.only(top: 4,left: 8,bottom: 4),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                                children: [
                                                  SmallText(text: "+10",color: Colors.white,fontWeight: FontWeight.w600,size: 24,textAlign: TextAlign.center,),
                                                  SmallText(text: "New York",color: Colors.white,fontWeight: FontWeight.w700,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),)),
                          // Expanded(child: ContainerDecorated(padding: 0,height: 90,child: ImageCommon(src: "https://i.pinimg.com/736x/32/d1/9f/32d19f4783418484ef25f29d197992da.jpg",fit: BoxFit.cover,borderRadius: 10,),)),
                          // Expanded(child: ContainerDecorated(padding: 0,height: 90,child: ImageCommon(src: "https://i.pinimg.com/736x/72/ca/0a/72ca0a0637fe9cfe884524ac94c48086.jpg",fit: BoxFit.cover,borderRadius: 10,),)),

                        ],
                      ),
                    ],
                  )),
                ],
              ),

              SizedBox(height: 24,),
              SmallText(text: "Analysis",fontWeight: FontWeight.w600,size: 16,),
              SizedBox(height: 16),

              Row(spacing: 16,children: [
                Expanded(
                  child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Last week",size: 13,),
                    SmallText(text: "3,608",size: 18,fontWeight: FontWeight.w800,),
                    Row(spacing: 8,children: [
                      ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowUp,color: Colors.green,size: 12,))),
                      SmallText(text: "13%")
                    ],)

                  ],),),
                ),
                Expanded(
                  child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Last month",size: 13,),
                    SmallText(text: "18,527",size: 18,fontWeight: FontWeight.w800,),
                    Row(spacing: 8,children: [
                      ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowDown,color: Colors.red,size: 12,))),
                      SmallText(text: "29%")
                    ],)

                  ],),),
                ),

                Expanded(
                  child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Last year",size: 13,),
                    SmallText(text: "743,354",size: 18,fontWeight: FontWeight.w800,),
                    Row(spacing: 8,children: [
                      ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowUp,color: Colors.green,size: 12,))),
                      SmallText(text: "34%")
                    ],)

                  ],),),
                ),
              ],),

              SizedBox(height: 24,),

              Row(spacing: 24,
                children: [
                  InkWell(onTap: (){
                    controller.selectedTab=0;
                    controller.update();
                  },
                    child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Row(spacing: 4,children: [
                            // Icon(Icons.border_all_rounded,size: 20,),
                            SmallText(text: "Recent",fontWeight: FontWeight.w600,size: 16,)
                          ],),
                          SizedBox(height: 4,),
                          Container(height: 2,width: 75,decoration: BoxDecoration(color: controller.selectedTab==0?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                        ],)
                      ],
                    ),
                  ),
                  InkWell(onTap: (){
                    controller.selectedTab=1;
                    controller.update();
                  },
                    child: Row(spacing: 4,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Row(spacing: 4,children: [
                            // Icon(Icons.perm_media_outlined,size: 16,),
                            SmallText(text: "Top",fontWeight: FontWeight.w600,size: 16,)
                          ],),
                          SizedBox(height: 4,),
                          Container(height: 2,width: 60,decoration: BoxDecoration(color: controller.selectedTab==1?Colors.black54:AppColors.scaffoldBackgroundColor,),)
                        ],)
                      ],
                    ),
                  ),


                ],
              ),
              Divider(height: 1,),

            ],),
          ),
        );
      }
    );
  }
}
