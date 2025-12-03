import 'package:civic_force/auth/login/login_screen.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../common_widget/app_bar.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
import '../../utils.dart';
import 'controller_intro_slider.dart';

class IntroSliderScreen extends StatelessWidget {
  const IntroSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerIntroSlider(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(title: "",color: Colors.black,height: 0,),
          body: Stack(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: isMobile()?Get.width:Get.width/3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(spacing: 48,children: [
                        Expanded(
                          child: PageView.builder(controller: controller.pageController,onPageChanged: (indexx){
                            controller.indexSelected=indexx;
                            controller.update();
                          },itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                            return Column(children: [
                              // Expanded(child: DotLottieLoader.fromAsset(controller.list[index]['image'], frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                              //         if (dotlottie != null) {
                              //           return Lottie.memory(dotlottie.animations.values.single);
                              //         } else {
                              //           return Container();
                              //         }
                              //       }),),
                              Expanded(child: controller.list[index]['image']),
                              SmallText(text: controller.list[index]['heading'],color: Colors.white,textAlign: TextAlign.center,size: 20,fontWeight: FontWeight.w600,),
                              SizedBox(height: 24,),
                              SmallText(text: controller.list[index]['description'],color: Colors.white70,textAlign: TextAlign.center,size: 12,),
                            ],);
                          }),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 8,children: [
                          ContainerDecorated(color:  controller.indexSelected==0?Colors.red:Colors.grey,width: controller.indexSelected==0? 20:8,height: 8,),
                          ContainerDecorated(color: controller.indexSelected==1?Colors.red:Colors.grey,width:  controller.indexSelected==1? 20:8,height: 8,),
                          ContainerDecorated(color: controller.indexSelected==2?Colors.red:Colors.grey,width:  controller.indexSelected==2? 20:8,height: 8,),
                        ],),
                        Row(spacing: 24,
                          children: [
                            if(controller.indexSelected!=0)ContainerDecorated(onTap: (){
                              controller.indexSelected--;
                              controller.pageController.jumpToPage(controller.indexSelected);
                              controller.update();
                            },colorBorder: Colors.white,color: Colors.black,borderRadius: 40,child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),),
                            Expanded(
                              child: ButtonSingleAtom(color: Colors.green,widget:  controller.indexSelected==2?"Continue": "Next",tap: (){
                                if( controller.indexSelected==2){
                                  Get.off(()=>LoginScreen());
                                  box.write(Utils.intro, true);
                                  return;
                                }else{
                                  controller.indexSelected++;
                                  controller.pageController.jumpToPage(controller.indexSelected);
                                  controller.update();
                                }
                              },),
                            ),
                          ],
                        ),
                      ],),
                    ),
                  ),

                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
