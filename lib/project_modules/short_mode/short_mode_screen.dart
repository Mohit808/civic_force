import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/short_mode/controller_short_mode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../common_widget/app_colors.dart';
import '../../common_widget/container_decorated.dart';
import '../../utils.dart';

class ShortModeScreen extends StatelessWidget {
  const ShortModeScreen({super.key, this.src});
  final dynamic src;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerShortMode(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",colorIconTheme: Colors.black,height: 0,),
          body: Stack(
            children: [
              PageView.builder(scrollDirection: Axis.vertical,physics: ClampingScrollPhysics(),itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                return Stack(
                  children: [
                    Column(children: [
                      Expanded(child: ImageCommon("${controller.list[index].image}",boxFit: BoxFit.fitWidth,))
                    ],),

                    InkWell(onTap: (){
                      Get.back();
                    },child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Icon(Icons.more_vert)
                        ],
                      ),
                    ),),


                    Positioned(bottom: 48,right: 24,
                      child: Column(spacing: 24,children: [

                        Column(children: [
                          Column(children: [
                            FaIcon(true? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,size: 24,color: true?Colors.red:Colors.black54,),
                            SizedBox(width: 8,),
                            SmallText(text: "0",fontWeight: FontWeight.w600,color: Colors.white70,),
                          ],)
                        ],),

                        InkWell(onTap: (){
                          showDialog(context: context, builder: (builder){
                            return Dialog(insetPadding: EdgeInsets.zero,child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(children: [
                                    Expanded(child: SmallText(text: "Re-Post",fontWeight: FontWeight.w700,size: 16,)),
                                    InkWell(onTap: (){
                                      Get.back();
                                    },child: Icon(Icons.close))
                                  ],),
                                  // SizedBox(height: 16,),
                                  // ContainerDecorated(color: Colors.white,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16),child: PostItemWidget(data: data)),
                                  SizedBox(height: 16,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(spacing: 8,children: [
                                        ImageCommon( "${userInfo?.image}",height: 40,width: 40,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 2,
                                          children: [
                                            SmallText(text: "${userInfo?.name}",fontWeight: FontWeight.w700,size: 14,),
                                            Row(spacing: 4,
                                              children: [
                                                Icon(Icons.language,size: 12,color: Colors.green,),
                                                SmallText(text: "public",color: Colors.green,fontWeight: FontWeight.w600,)
                                              ],
                                            ),
                                          ],
                                        )
                                      ],),
                                      ContainerDecorated(onTap: (){
                                        // DataSourceCommon().retweetFunction(data.id);
                                      },color: AppColors.primary,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                        child: Row(mainAxisSize: MainAxisSize.min,spacing: 8,
                                          children: [
                                            SmallText(text: "Send post",color: Colors.white,fontWeight: FontWeight.w600,),
                                            Icon(Icons.send,size: 16,color: Colors.white,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),);
                          });
                        },
                          child: Column(children: [
                            Stack(
                              children: [
                                // FaIcon(FontAwesomeIcons.retweet,size: 25,color: Colors.black54,),
                                FaIcon(FontAwesomeIcons.retweet,size: 24,color: Colors.white70,shadows: [
                                  Shadow(color: Colors.white70,blurRadius: 5),
                                  // Shadow(color: Colors.black54,blurRadius: 5),
                                ],),
                              ],
                            ),
                            SizedBox(width: 8,),
                            Stack(
                              children: [
                                Text("2.4M",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,shadows: [
                                  Shadow(color: Colors.white70,blurRadius: 5),
                                  Shadow(color: Colors.black54,blurRadius: 5),
                                ]),),

                                Text("2.3M",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,shadows: [
                                  Shadow(color: Colors.white70,blurRadius: 5),
                                  Shadow(color: Colors.black54,blurRadius: 5),
                                ]),),
                              ],
                            )
                          ],),
                        ),


                        InkWell(onTap: (){
                          // Get.to(()=>CommentScreen(postId: data.id,));
                        },
                          child: Column(children: [
                            FaIcon(FontAwesomeIcons.commentDots,size: 24,color: Colors.white70,shadows: [
                              Shadow(color: Colors.white70,blurRadius: 5),
                              // Shadow(color: Colors.black54,blurRadius: 5),
                            ],),
                            SizedBox(width: 8,),
                            Stack(
                              children: [
                                Text("201K",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,shadows: [
                                  Shadow(color: Colors.white70,blurRadius: 5),
                                  Shadow(color: Colors.black54,blurRadius: 5),
                                ]),),

                                Text("201K",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,shadows: [
                                  Shadow(color: Colors.white70,blurRadius: 5),
                                  Shadow(color: Colors.black54,blurRadius: 5),
                                ]),),
                              ],
                            )
                          ],),
                        ),

                        Column(children: [
                          Stack(
                            children: [
                              FaIcon(FontAwesomeIcons.chartSimple,size: 24,color: Colors.white70,shadows: [
                                Shadow(color: Colors.white70,blurRadius: 5),
                                // Shadow(color: Colors.black54,blurRadius: 5),
                              ],),

                              FaIcon(FontAwesomeIcons.chartSimple,size: 24,color: Colors.black54,shadows: [
                                Shadow(color: Colors.white70,blurRadius: 5),
                                // Shadow(color: Colors.black54,blurRadius: 5),
                              ],),
                            ],
                          ),
                          SizedBox(width: 8,),
                          Stack(
                            children: [
                              Text("10.5M",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,shadows: [
                                Shadow(color: Colors.white70,blurRadius: 5),
                                Shadow(color: Colors.black54,blurRadius: 5),
                              ]),),

                              Text("10.5M",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,shadows: [
                                Shadow(color: Colors.white70,blurRadius: 5),
                                Shadow(color: Colors.black54,blurRadius: 5),
                              ]),),


                            ],
                          )
                        ],),

                        InkWell(onTap: () async {
                        },
                          child: Column(children: [
                            // controller.apiResponseSavedPost.status==Status.LOADING && controller.indexLoadingSaved==data.id!.toInt()?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):
                            // FaIcon(true?FontAwesomeIcons.solidBookmark: FontAwesomeIcons.bookmark,size: 24,color: true?Colors.red:Colors.black54,),
                            FaIcon(FontAwesomeIcons.solidBookmark,size: 24,color: Colors.red,shadows: [
                              Shadow(color: Colors.white70,blurRadius: 5),
                              Shadow(color: Colors.black54,blurRadius: 5),
                            ],),
                            SizedBox(width: 8,)
                          ],),
                        ),


                        Stack(
                          children: [
                            FaIcon(FontAwesomeIcons.shareFromSquare,size: 25,color: Colors.white70,shadows: [
                              Shadow(color: Colors.white70,blurRadius: 5),
                            ],),
                            FaIcon(FontAwesomeIcons.shareFromSquare,size: 24,color: Colors.black54,),
                          ],
                        ),
                      ]),
                    ),

                    Positioned(bottom: 48,left: 24,right: 70,child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,
                      children: [
                        Row(spacing: 16,children: [
                          ImageCommon(controller.list[index].user?.image??"https://i.pinimg.com/1200x/f0/38/38/f038383985e6289f4c208150818e01ab.jpg",sizeAndCircle: 35,),
                          SmallText(text: controller.list[index].user?.name??"Ivan",fontWeight: FontWeight.w600,maxLine: 1,size: 15,),
                          Container(decoration: BoxDecoration(border: Border.all(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),child: SmallText(text: "Follow",fontWeight: FontWeight.w600,))
                        ],),
                        SmallText(text: "${controller.list[index].text}",maxLine: 2,overflow: TextOverflow.ellipsis,size: 15,),

                        Wrap(spacing: 16,runSpacing: 16,children: [
                          for(var x in controller.list[index].tagList??[])
                            SmallText(text: "#${x.name}",color: Colors.blue,fontWeight: FontWeight.w400,size: 15,)
                        ],)
                      ],
                    )),

                  ],
                );
              }),
              InkWell(onTap: (){
                Get.back();
              },child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                  ],
                ),
              ),),
            ],
          ),
        );
      }
    );
  }
}
