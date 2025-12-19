import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/city/city_main_widget.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../common_widget/app_bar.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List list=["Healthcare","Crime","Corruption","Education","Water","Child Safety","Public Transport","Violence","Police Misconduct"];
    List listColor=[Colors.orange,Colors.deepPurple,Colors.teal,Colors.pink,Colors.blue,Colors.blueAccent,Colors.purple,Colors.green,Colors.cyan];
    List listIcon=[AppImages.healthcare,AppImages.crime,AppImages.corruption,AppImages.education,AppImages.water,AppImages.childSafety,AppImages.publicTransport,AppImages.violence,AppImages.police];
    return Scaffold(
      appBar: AppBarCommon(title: "Analysis",color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,colorIconTheme: Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            // SmallText(text: "Healthcare"),
            // SmallText(text: "Crime"),
            // SmallText(text: "Corruption"),
            // SmallText(text: "Education"),
            // SmallText(text: "Water"),
            // SmallText(text: "Child Safety"),
            // SmallText(text: "Public Transport"),
            // SmallText(text: "Violence"),
            // SmallText(text: "Police Misconduct"),



            ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: list.length, itemBuilder: (itemBuilder,index){
              return

                  Container(decoration: BoxDecoration(color: listColor[index].withOpacity(0.1),borderRadius: BorderRadius.circular(10)
                      // image: DecorationImage(image: AssetImage(AppImages.healthcare))
                  ),
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
                            SmallText(text: "${list[index]}",color: listColor[index],size: 18,fontWeight: FontWeight.w600,),
                            SmallText(text: "100 case reported",color: listColor[index],),
                            ContainerDecorated(borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 4),color: listColor[index],child: Row(spacing: 4,mainAxisSize: MainAxisSize.min,children: [
                              SmallText(text: "View",color: Colors.white,fontWeight: FontWeight.w600,size: 11,),
                              Icon(Icons.arrow_forward,size: 16,color: Colors.white,),
                            ],),)
                          ],),
                        ),
                      ),

                      Image.asset(listIcon[index],height: 100,width: 100,),

                    ],),
                  );

              //   ContainerDecorated(child: Row(spacing: 16,
              //   children: [
              //     Image.asset(AppImages.healthcare,height: 70,width: 70,),
              //     Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SmallText(text: list[index],fontWeight: FontWeight.w600,size: 16,),
              //         SmallText(text:"100 Reported",fontWeight: FontWeight.w500,size: 10,),
              //       ],
              //     ),
              //   ],
              // ),);
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 36,); },),

            // ImageCommon(src: AppImages.screenShot)
          ],),
        ),
      ),
    );
  }
}
