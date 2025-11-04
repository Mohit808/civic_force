import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/app_bar.dart';
import '../polls_screen/polls_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Account"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(spacing: 12,children: [

          Column(spacing: 16,children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network("https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",height: 80,width: 80,fit: BoxFit.cover,)),
                Positioned(bottom: 0,right: 0,
                  child: ContainerDecorated(borderRadius: 40,color: Colors.black,
                    child: Row(mainAxisSize: MainAxisSize.min,children: [
                      Icon(Icons.edit,size: 16,color: Colors.white,),
                    ],),
                  ),
                )
              ],
            ),
            SmallText(text: "Amit Yadav",fontWeight: FontWeight.w600,size: 18,),
          ],),
          SizedBox(height: 16,),

          Divider(),
          Row(spacing: 16,children: [
            ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.panorama_rounded,size: 16,color: Colors.white,)),
            Expanded(child: SmallText(text: "My Posts",fontWeight: FontWeight.w600,)),
            Icon(Icons.arrow_forward,size: 16,)
          ],),

          Divider(),

          InkWell(onTap: (){
            Get.to(()=>PollsScreen());
          },
            child: Row(spacing: 16,children: [
              ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.poll_sharp,size: 16,color: Colors.white,)),
              Expanded(child: SmallText(text: "My Polls",fontWeight: FontWeight.w600,)),
              Icon(Icons.arrow_forward,size: 16,)
            ],),
          ),

          Divider(),

          Row(spacing: 16,children: [
            ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.priority_high_sharp,size: 16,color: Colors.white,)),
            Expanded(child: SmallText(text: "Terms and conditions",fontWeight: FontWeight.w600,)),
            Icon(Icons.arrow_forward,size: 16,)
          ],),

          Divider(),

          Row(spacing: 16,children: [
            ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.privacy_tip,size: 16,color: Colors.white,)),
            Expanded(child: SmallText(text: "Privacy Policy",fontWeight: FontWeight.w600,)),
            Icon(Icons.arrow_forward,size: 16,)
          ],),

          Divider(),

          Row(spacing: 16,children: [
            ContainerDecorated(color: Colors.black,borderRadius: 40,child: Icon(Icons.info,size: 16,color: Colors.white,)),
            Expanded(child: SmallText(text: "About us",fontWeight: FontWeight.w600,)),
            Icon(Icons.arrow_forward,size: 16,)
          ],),

          SizedBox(height: 16,),

          ContainerDecorated(padding: 12,colorBorder: Colors.grey.shade300,
            child: Row(spacing: 16,mainAxisAlignment: MainAxisAlignment.center,children: [
              Icon(Icons.exit_to_app_rounded,size: 16,),
              SmallText(text: "Logout",fontWeight: FontWeight.w600,)
            ],),
          )
        ],),
      ),
    );
  }
}
