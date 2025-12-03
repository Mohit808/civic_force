import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/app_bar.dart';
import '../../../common_widget/button_single_atom.dart';
import '../../../common_widget/text_common.dart';
import '../../../common_widget/textfield_atom.dart';
import 'controller_reset_password.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key, this.otp, this.email});
  final dynamic email;
  final dynamic otp;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerResetPassword(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(title: "Reset password",color: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  SmallText(text: "Password *",color: Colors.white,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(isPassword: true,textCapitalization: TextCapitalization.none,controller: controller.textEditingControllerPassword,validator: (value){
                    if(value!.isEmpty) return "Password is required";
                    if(value.length<5) return "Min 5 char required";
                    return null;
                  },onChanged: (text){
                    // controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter password...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),

                  SizedBox(height: 24,),
                  SmallText(text: "Confirm Password *",color: Colors.white,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(isPassword: true,textCapitalization: TextCapitalization.none,controller: controller.textEditingControllerConfirm,validator: (value){
                    if(value!.isEmpty) return "Password is required";
                    if(value.length<5) return "Min 5 char required";
                    if(value!=controller.textEditingControllerPassword.text) return "Pass not match";
                    return null;
                  },onChanged: (text){
                    // controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter password...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),

                  SizedBox(height: 48,),
                  ButtonSingleAtom(status: controller.apiResponse.status,widget: "Submit",tap: (){
                    controller.postData(email: email,otp: otp);
                  },)
                ],),
              ),
            ),
          ),
        );
      }
    );
  }
}
