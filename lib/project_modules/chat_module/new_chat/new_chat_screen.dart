import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "New chat"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            TextFieldCommon(hintText: "Search here..."),
            SizedBox(height: 16,),
            SizedBox(height: 24,),
            SmallText(text: "Mutual friend",fontWeight: FontWeight.w600,),
            SizedBox(height: 16,),

            ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 5,shrinkWrap: true,itemBuilder: (itemBuilder,index){
              return Row(spacing: 16,
                children: [
                  ImageCommon("src",sizeAndCircle: 40,),
                  SmallText(text: "Amit Yadav",size: 15,fontWeight: FontWeight.w600,)
                ],
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),

            SizedBox(height: 24,),
            SmallText(text: "Found on Contacts",fontWeight: FontWeight.w600,),
            SizedBox(height: 16,),

            ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 5,shrinkWrap: true,itemBuilder: (itemBuilder,index){
              return Row(spacing: 16,
                children: [
                  ImageCommon("src",sizeAndCircle: 40,),
                  SmallText(text: "Amit Yadav",size: 15,fontWeight: FontWeight.w600,)
                ],
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),

            SizedBox(height: 24,),
            SmallText(text: "Invite contacts",fontWeight: FontWeight.w600,),
            SizedBox(height: 16,),

            ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 5,shrinkWrap: true,itemBuilder: (itemBuilder,index){
              return Row(spacing: 16,
                children: [
                  ImageCommon("src",sizeAndCircle: 40,),
                  Expanded(child: SmallText(text: "Amit Yadav",size: 15,fontWeight: FontWeight.w600,)),
                  Row(spacing: 8,
                    children: [
                      Icon(Icons.add,size: 16,color: Colors.green,),
                      SmallText(text: "Invite",color: Colors.green,fontWeight: FontWeight.w500,),
                    ],
                  )
                ],
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 24,); },),



          ],),
        ),
      ),
    );
  }
}
