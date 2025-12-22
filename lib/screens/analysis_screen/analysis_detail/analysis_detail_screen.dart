import 'dart:ui';
import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/post/post_main_list_widget.dart';
import 'package:civic_force/screens/analysis_screen/analysis_detail/controller_analysis_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../city/city_screen.dart';


class AnalysisDetailScreen extends StatelessWidget {
  const AnalysisDetailScreen({super.key, required this.tagName});
  final String? tagName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAnalysisDetail(tagName: tagName),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: SmallText(text: "#${controller.tagName}",size: 20,)),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
                SmallText(text: "Reported in ${controller.totalCities??"--"} cities",fontWeight: FontWeight.w600,size: 16,),
                SizedBox(height: 16),
                if(controller.list.isNotEmpty)Row(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: ContainerDecorated(onTap: (){
                      Get.to(()=>CityScreen());
                    },padding: 0,height: 190,child: Stack(
                      children: [
                        Row(children: [
                            Expanded(child: ImageCommon(src: controller.list.first.image??"https://i.pinimg.com/736x/e6/db/22/e6db22d8dc84cd25b5977292bc5ac2a0.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                          ],
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                      child: Container(color: Colors.black.withOpacity(0.1), padding: EdgeInsets.only(top: 8,left: 8,bottom: 8),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                          children: [
                                            SmallText(text:  controller.list.first.name?? "",color: Colors.white,fontWeight: FontWeight.w700,),
                                            SmallText(text: "Most ${controller.list.first.postCount} cases",color: Colors.white,size: 12,)
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
                            Expanded(child: controller.list.length<2?SizedBox(): ContainerDecorated(padding: 0,height: 90,child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: ImageCommon( height: 90,width: 90, src:  controller.list[1].image??"https://i.pinimg.com/736x/70/cb/43/70cb4328c48f6c57426dbbe66c227ca2.jpg",fit: BoxFit.cover,borderRadius: 10,)),
                                  ],
                                ),
                                Column(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                              child: Container(color: Colors.black.withOpacity(0.1),
                                                padding: EdgeInsets.only(top: 4,left: 8,bottom: 4),
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                                  children: [
                                                    SmallText(text: controller.list[1].name??"",color: Colors.white,fontWeight: FontWeight.w700,maxLine: 1,overflow: TextOverflow.ellipsis),
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
                            Expanded(child: controller.list.length<3?SizedBox(): ContainerDecorated(padding: 0,height: 90,child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: ImageCommon(height: 90,width: 90,src:  controller.list[2].image?? "https://i.pinimg.com/736x/70/cb/43/70cb4328c48f6c57426dbbe66c227ca2.jpg",fit: BoxFit.cover,borderRadius: 10,)),
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
                                                    SmallText(text: controller.list[2].name??"London",color: Colors.white,fontWeight: FontWeight.w700,maxLine: 1,overflow: TextOverflow.ellipsis),
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
                            Expanded(child: controller.list.length<4? SizedBox(): ContainerDecorated(padding: 0,width: 90,height: 90,child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: ImageCommon(height: 90,width: 90,src: controller.list[3].image??  "https://i.pinimg.com/736x/70/cb/43/70cb4328c48f6c57426dbbe66c227ca2.jpg",fit: BoxFit.cover,borderRadius: 10,)),
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
                                                    SmallText(text:controller.list[3].name?? "Mumbai",color: Colors.white,fontWeight: FontWeight.w700,maxLine: 1,overflow: TextOverflow.ellipsis),
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
                            Expanded(child: controller.list.length<5? SizedBox(): ContainerDecorated(padding: 0,width: 90,height: 90,child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child:  ImageCommon(height: 90,width: 90,src: controller.list[4].image?? "https://i.pinimg.com/736x/70/cb/43/70cb4328c48f6c57426dbbe66c227ca2.jpg",fit: BoxFit.cover,borderRadius: 10,)),
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
                                                    if(controller.list.length>5)SmallText(text: "+${controller.list.length-5}",color: Colors.white,fontWeight: FontWeight.w600,size: 24,textAlign: TextAlign.center,),
                                                    SmallText(text: controller.list[4].name??"New York",color: Colors.white,fontWeight: FontWeight.w700,maxLine: 1,overflow: TextOverflow.ellipsis,),
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
                    child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      SmallText(text: "This week",size: 13,),
                      Row(
                        children: [
                          SmallText(text: "${controller.postStats?.lastWeek?.current??"--"}",size: 18,fontWeight: FontWeight.w800,),
                          SizedBox(width: 4,),
                          SmallText(text: "/"),
                          SizedBox(width: 4,),
                          SmallText(text: "${controller.postStats?.lastWeek?.previous??"--"}",size: 14,fontWeight: FontWeight.w500,),
                          Expanded(child: SmallText(text: " previous",size: 12,fontWeight: FontWeight.w400,maxLine: 1,overflow: TextOverflow.ellipsis,))
                        ],
                      ),

                      // Row(spacing: 8,children: [
                      //   ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowUp,color: Colors.green,size: 12,))),
                      //   SmallText(text: "${percentageOnly(controller.postStats?.lastWeek?.current,controller.postStats?.lastWeek?.previous)}%")
                      // ],)

                    ],),),
                  ),
                  Expanded(
                    child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      SmallText(text: "Last month",size: 13,),
                      Row(
                        children: [
                          SmallText(text: "${controller.postStats?.lastMonth?.current??"--"}",size: 18,fontWeight: FontWeight.w800,),
                          SizedBox(width: 2,),
                          SmallText(text: "/"),
                          SizedBox(width: 2,),
                          SmallText(text: "${controller.postStats?.lastMonth?.previous??"--"}",size: 14,fontWeight: FontWeight.w500,),
                          Expanded(child: SmallText(text: " previous",size: 12,fontWeight: FontWeight.w400,maxLine: 1,overflow: TextOverflow.ellipsis,))
                        ],
                      ),
                      // Row(spacing: 8,children: [
                      //   ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowDown,color: Colors.red,size: 12,))),
                      //   SmallText(text: "${percentageOnly(controller.postStats?.lastMonth?.current,controller.postStats?.lastWeek?.previous)}%")
                      // ],)

                    ],),),
                  ),

                  Expanded(
                    child: ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: AppColors.primary.withOpacity(0.5),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      SmallText(text: "Last year",size: 13,),
                      Row(
                        children: [
                          SmallText(text: "${controller.postStats?.lastYear?.current??"--"}",size: 18,fontWeight: FontWeight.w800,),
                          SizedBox(width: 2,),
                          SmallText(text: "/"),
                          SizedBox(width: 2,),
                          SmallText(text: "${controller.postStats?.lastYear?.previous??"--"}",size: 14,fontWeight: FontWeight.w500,),
                          Expanded(child: SmallText(text: " previous",size: 12,fontWeight: FontWeight.w400,maxLine: 1,overflow: TextOverflow.ellipsis,))
                        ],
                      )
                      // Row(spacing: 8,children: [
                      //   ContainerDecorated(borderRadius: 20,height: 20,width:20,child: Center(child: FaIcon(FontAwesomeIcons.arrowUp,color: Colors.green,size: 12,))),
                      //   SmallText(text: "34%")
                      // ],)
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

                PostMainListWidget(tags: tagName,tag: "analysis",)

              ],),
            ),
          ),
        );
      }
    );
  }
  double percentageOnly(current, previous) {
    if (previous == 0) return current > 0 ? 100 : 0;
    return ((current - previous) / previous) * 100;
  }

}
