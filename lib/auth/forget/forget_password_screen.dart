import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/text_common.dart';
import '../../common_widget/textfield_atom.dart';
import '../../utils/app_images.dart';
import 'controller_forget_password.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, this.email});

  final dynamic email;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerForgetPassword(email: email),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(title: "Forget password",color: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,children: [

                // dotlottie
                SizedBox(height: 24,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(constraints: BoxConstraints(maxWidth: 150),
                      child: DotLottieLoader.fromAsset(AppImages.forgotPassword, frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                        if (dotlottie != null) {
                          return Lottie.memory(dotlottie.animations.values.single);
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  ],
                ),

                SizedBox(height: 24,),

                SmallText(text: "Email address",fontWeight: FontWeight.w600,color: Colors.white,),
                Form(key: controller.formKey,
                  child: TextFieldCommon(keyboardType: TextInputType.emailAddress,textCapitalization: TextCapitalization.none,controller: controller.textEditingControllerEmail,validator: (value){
                    if(!GetUtils.isEmail("$value")) return "Invalid email";
                    if(value!.isEmpty) return "Email is required";
                    return null;
                  },onChanged: (text){
                    // controller.update();
                  },BorderColor: Colors.transparent,hintText: "Enter email...",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.5),),
                ),
                SizedBox(height: 48,),
                ButtonSingleAtom(status: controller.apiResponse.status,widget: "Continue",tap: (){
                  controller.postData();
                },),

              ],),
            ),
          ),
        );
      }
    );
  }
}
