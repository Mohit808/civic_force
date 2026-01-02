import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../common_widget/app_bar.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
import '../../common_widget/textfield_atom.dart';
import '../../screens/intro_slider_screen/intro_slider_screen.dart';
import '../forget/forget_password_screen.dart';
import '../sign_up/sign_up_screen.dart';
import 'controller_login.dart';
import 'google_signin_common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerLogin(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: SmallText(text: "Login",size: 18,),centerTitle: false,actions: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: (){
                  Get.offAll(()=>IntroSliderScreen());
                },child: SmallText(text: "Know more ?",color: Colors.green,)),
              ],
            ),
            SizedBox(width: 16,)
          ],),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  const SizedBox(height: 36,),
                  SmallText(text: "Email *",fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(keyboardType: TextInputType.emailAddress,textCapitalization: TextCapitalization.none,controller: controller.textEditingControllerEmail,validator: (value){
                    if(!GetUtils.isEmail("$value")) return "Invalid email";
                    return null;
                  },onChanged: (text){
                    controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter email...",borderRadius: 30,),

                  SizedBox(height: 24,),
                  SmallText(text: "Password *",fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  TextFieldCommon(isPassword: true,controller: controller.textEditingControllerPass,validator: (value){
                    if("$value".length<5) return "Minimum 5 char required";
                    return null;
                  },onChanged: (text){
                    controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter pass...",borderRadius: 30,),
                  SizedBox(height: 16,),
                  InkWell(onTap: (){
                    Get.to(()=>ForgetPasswordScreen());
                  },child: SmallText(text: "Forgot password?",color: Colors.blue,fontWeight: FontWeight.w600,)),
                  SizedBox(height: 48,),
                  ButtonSingleAtom(color: Colors.green,status: controller.apiResponse.status,widget: "Login",tap: (){
                    controller.postData();
                  },),

                  SizedBox(height: 48,),

                  Row(spacing: 4,children: [
                    for(var x in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
                      Expanded(child: ContainerDecorated(height: 1,color: Color(0xFF555555),)),
                    SizedBox(),
                    SmallText(text: "OR",),
                    SizedBox(),
                    for(var x in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
                      Expanded(child: ContainerDecorated(height: 1,color: Color(0xFF555555),)),
                  ],),

                  SizedBox(height: 48,),
                  ButtonSingleAtom(borderRadius: 24,widget: Row(children: [
                    FaIcon(FontAwesomeIcons.google,size: 20,color: Colors.white,),
                    Expanded(child: SmallText(text: "Continue with login",textAlign: TextAlign.center,color: Colors.white,)),
                  ],),tap: (){
                    GoogleSignInCommon().signInWithGoogle();
                  },),

                  SizedBox(height: 16,),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Don't have account?",color: Colors.black54,),
                      InkWell(onTap: (){
                        Get.to(()=>SignUpScreen());
                      },child: Container(padding: EdgeInsets.only(right: 8,left: 8),alignment: AlignmentGeometry.center,height: 40,child: SmallText(text: "Sign up",color: Colors.blue,fontWeight: FontWeight.w600,))),
                    ],
                  ),

                ],),
              ),
            ),
          ),
        );
      }
    );
  }

}
