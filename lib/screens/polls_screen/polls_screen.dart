import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Polls"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SmallText(text: "Are you a morning, afternoon, evening or night person?",fontWeight: FontWeight.w600,size: 20,),
            SizedBox(height: 8,),
            Row(
              children: [
                SmallText(text: "Asked by ", color: Colors.black54,),
                SmallText(text: "Anonymous ",fontWeight: FontWeight.w500,),
                SmallText(text: "about 3 hour ago",color: Colors.black54,),
              ],
            ),
            SizedBox(height: 36,),

            ContainerDecorated(color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
              SizedBox(height: 20,width: 20,child: Radio(value: false, groupValue: true, onChanged: (value){})),
              SmallText(text: "Morning",fontWeight: FontWeight.w600,)
            ],),),

            SizedBox(height: 16,),

            ContainerDecorated(color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
              SizedBox(height: 20,width: 20,child: Radio(value: false, groupValue: true, onChanged: (value){})),
              SmallText(text: "Afternoon",fontWeight: FontWeight.w600,)
            ],),),

            SizedBox(height: 16,),

            ContainerDecorated(color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
              SizedBox(height: 20,width: 20,child: Radio(value: false, groupValue: true, onChanged: (value){})),
              SmallText(text: "Evening",fontWeight: FontWeight.w600,)
            ],),),

            SizedBox(height: 16,),

              ContainerDecorated(color: Colors.white,elevation: 1,padding: 16,colorBorder: Colors.grey.withOpacity(0.2),child: Row(spacing: 16,children: [
              SizedBox(height: 20,width: 20,child: Radio(value: false, groupValue: true, onChanged: (value){})),
              SmallText(text: "Night",fontWeight: FontWeight.w600,)
            ],),),

            SizedBox(height: 16,),

            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              ContainerDecorated(borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: Colors.green,child: SmallText(text: "Submit your vote",color: Colors.white,fontWeight: FontWeight.w600,)),
            ],),

            SizedBox(height: 36,),

            for(var x in [1,2,3,4,5])
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "Are you a morning, afternoon, evening or night person?",fontWeight: FontWeight.w600,size: 20,),
              SizedBox(height: 8,),
              Row(
                children: [
                  SmallText(text: "Asked by ", color: Colors.black54,),
                  SmallText(text: "Anonymous ",fontWeight: FontWeight.w500,),
                  SmallText(text: "about 3 hour ago",color: Colors.black54,),
                ],
              ),

              SizedBox(height: 36,),


              Container(decoration: BoxDecoration(color: Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Morning",fontWeight: FontWeight.w600,),)),
                  SizedBox(width: 75,),
                  SmallText(text: "25%",fontWeight: FontWeight.w600,)
                ],),
              ),

              SizedBox(height: 16,),

              Container(decoration: BoxDecoration(color: Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Afternoon",fontWeight: FontWeight.w600,),)),
                  SizedBox(width: 175,),
                  Row(spacing: 8,
                    children: [
                      SmallText(text: "13%",fontWeight: FontWeight.w600,),
                      Icon(Icons.check_circle_outline_rounded,size: 16,color: Colors.orange.withOpacity(0.9))
                    ],
                  )
                ],),
              ),

              SizedBox(height: 16,),

              Container(decoration: BoxDecoration(color: Colors.orange.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  Expanded(child: ContainerDecorated(color: Colors.orange.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Evening",fontWeight: FontWeight.w600,),)),
                  SizedBox(width: 45,),
                  SmallText(text: "0%",fontWeight: FontWeight.w600,),
                ],),
              ),

              SizedBox(height: 16,),

              Container(decoration: BoxDecoration(color: Colors.deepPurpleAccent.withOpacity(0.03),borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                  Expanded(child: ContainerDecorated(color: Colors.deepPurpleAccent.withOpacity(0.1),padding: 8,borderRadius: 30,child: SmallText(text: "Night",fontWeight: FontWeight.w600,),)),
                  SizedBox(width: 55,),
                  SmallText(text: "63%",fontWeight: FontWeight.w600,)
                ],),
              ),

              SizedBox(height: 16,),

              Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                FaIcon(FontAwesomeIcons.chartSimple,size: 16,color: Colors.black54,),
                SizedBox(width: 8,),
                SmallText(text: "20K"),
                SizedBox(width: 30,),
                Icon(Icons.delete,size: 16,color: Colors.redAccent,),
                SizedBox(width: 8,),
                SmallText(text: "Delete",color: Colors.red,fontWeight: FontWeight.w500,)

              ],),
              SizedBox(height: 16,),
              Divider(),
              SizedBox(height: 16,),
            ],)



          ],),
        ),
      ),
    );
  }
}
