import 'package:civic_force/data_source/data_source_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/container_decorated.dart';
import '../../../common_widget/text_common.dart';
import '../../../utils.dart';

class ConsentPage extends StatelessWidget {
  ConsentPage({super.key});
  RxBool isCheck=true.obs;
  @override
  Widget build(BuildContext context) {
    return Column(spacing: 16,mainAxisSize: MainAxisSize.min,children: [
      SmallText(text: "Contacts Access & Consent",color: Colors.white,size: 18,fontWeight: FontWeight.w700,),
      SmallText(text: "To provide a better experience, this app needs permission to access your contacts. We use this information to help you connect with people you know.",color: Colors.white,textAlign: TextAlign.center,),
      SmallText(text: "By granting permission, you agree that:",color: Colors.white60,),
      Row(spacing: 9,crossAxisAlignment: CrossAxisAlignment.start,children: [
        ContainerDecorated(height: 4,width: 4,marginEdgeInsets: EdgeInsets.only(top: 4),),
        Expanded(child: SmallText(text: "Your contact data securely stored on our servers.",color: Colors.white60,)),
      ],),
      Row(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
        ContainerDecorated(height: 4,width: 4,marginEdgeInsets: EdgeInsets.only(top: 4),),
        Expanded(child: SmallText(text: "Your data will only be used for app-related features.",color: Colors.white60,)),
      ],),
      Row(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [
        ContainerDecorated(height: 4,width: 4,marginEdgeInsets: EdgeInsets.only(top: 4),),
        Expanded(child: SmallText(text: "Your information will not be sold, shared, or disclosed to any third party without your explicit consent.",color: Colors.white60,)),
      ],),
      SmallText(text: "We prioritize your privacy and follow strict data protection practices.",color: Colors.white60,),

      Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,children: [
        SizedBox(height: 20,width: 20,
          child: Obx(()=>Checkbox(checkColor: Colors.green,value: isCheck.value, onChanged: (onChanged){
            isCheck.value=onChanged!;
          })),
        ),
        Expanded(child: SmallText(text: "I consent to the app accessing my contacts and storing this data securely on the server. I understand that my information will only be used for app features and will not be shared with any third party.",color: Colors.white,))
      ],),
      Row(spacing: 16,children: [
        Expanded(child: ButtonSingleAtom(tap: (){
          Get.back();
          box.write("contactDenied", true);
        },widget: "Cancel",color: Color(0xFF404040),colorText: Colors.grey,borderRadius: 30,)),

        Expanded(child: Obx(()=>ButtonSingleAtom(tap: () async {
          if(isCheck.value==false) return;
          Get.back();

          DataSourceContacts().uploadContacts();

        },widget: "Continue",color: isCheck.value? Colors.green:Colors.grey,borderRadius: 30,colorText: Colors.black,))),
      ],)
    ]);
  }
}
