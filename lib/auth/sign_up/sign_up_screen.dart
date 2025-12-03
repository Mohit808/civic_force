import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
import '../../common_widget/textfield_atom.dart';
import '../login/google_signin_common.dart';
import 'controller_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSignUp(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(title: "Sign up",color: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  const SizedBox(height: 36,),
                  SmallText(text: "Email *",color: Colors.white,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(textCapitalization: TextCapitalization.none,keyboardType: TextInputType.emailAddress,controller: controller.textEditingControllerEmail,validator: (value){
                    if(!GetUtils.isEmail("$value")) return "Invalid email";
                    return null;
                  },onChanged: (text){
                    controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter email...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),

                  SizedBox(height: 24,),
                  SmallText(text: "Password *",color: Colors.white,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(validator: (value){
                    if("$value".length<5) return "Minimum 5 char required";
                    return null;
                  },controller: controller.textEditingControllerPass,isPassword: true,onChanged: (text){
                    controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter pass...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),

                  SizedBox(height: 24,),
                  SmallText(text: "Confirm Password *",color: Colors.white,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(validator: (value){
                    if("$value".length<5) return "Minimum 5 char required";
                    if("$value"!=controller.textEditingControllerPass.text) return "Password not match";
                    return null;
                  },controller: controller.textEditingControllerConfirm,isPassword: true,onChanged: (text){
                    controller.update();
                  },BorderColor: Colors.transparent,hintText: "Confirm pass...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),

                  SizedBox(height: 48,),
                  ButtonSingleAtom(color: Colors.green,status: controller.apiResponse.status,widget: "Sign up",tap: (){
                    controller.postData();
                  },),
                  SizedBox(height: 48,),

                  Row(spacing: 4,children: [
                    for(var x in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
                      Expanded(child: ContainerDecorated(height: 1,color: Color(0xFF555555),)),
                    SizedBox(),
                    SmallText(text: "OR",color: Colors.white,),
                    SizedBox(),
                    for(var x in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
                      Expanded(child: ContainerDecorated(height: 1,color: Color(0xFF555555),)),
                  ],),

                  SizedBox(height: 48,),
                  ButtonSingleAtom(color: Colors.black,colorBorder: Colors.white70,borderRadius: 24,widget: Row(children: [
                    FaIcon(FontAwesomeIcons.google,color: Colors.white,size: 20,),
                    Expanded(child: SmallText(text: "Continue with google",color: Colors.white,textAlign: TextAlign.center,)),
                  ],),tap: (){
                    GoogleSignInCommon().signInWithGoogle();
                  },),

                  SizedBox(height: 24,),

                  Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Already have account?",color: Colors.white60,),
                      SmallText(text: "Login",color: Colors.blue,fontWeight: FontWeight.w600,),
                    ],
                  ),

                ],),
              ),
            ),
          )
        );
      }
    );
  }
}
