import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/screens/polls_screen/create_poll/controller_create_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreatePollScreen extends StatelessWidget {
  const CreatePollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCreatePost(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Create Poll"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  SmallText(text: "Ask a question",fontWeight: FontWeight.w500,),
                  SizedBox(height: 16,),
                  TextFieldCommon(controller: controller.textEditingControllerQuestion,hintText: "Type you question...",fillColor: Colors.white,validator: (value){
                    if(value!.isEmpty) return "Write here";
                    return null;
                  },),
                  SizedBox(height: 36,),

                  SmallText(text: "Vote type",fontWeight: FontWeight.w500,),
                  SizedBox(height: 16,),
                  Row(children: [
                    Expanded(
                      child: Row(spacing: 8,children: [
                        SizedBox(height: 20,width: 20,child: Radio(value: !controller.isMultiple,groupValue: true,)),
                        SmallText(text: "Single choice"),
                      ],),
                    ),
                    Expanded(
                      child: Row(spacing: 8,children: [
                        SizedBox(height: 20,width: 20,child: Radio(value: controller.isMultiple,groupValue: true,)),
                        SmallText(text: "Multiple choice"),
                      ],),
                    ),
                  ],),


                  SizedBox(height: 36,),


                  Row(
                    children: [
                      Expanded(child: SmallText(text: "Expires at",fontWeight: FontWeight.w500,)),
                      SmallText(text: "Never",color: controller.isChecked?Colors.black: Colors.black54,),
                      SizedBox(width: 8,),
                      SizedBox(height: 20,width: 20,child: Checkbox(value: controller.isChecked, onChanged: (onChanged){
                        controller.isChecked=onChanged??false;
                        controller.selectedFullDate=null;
                        controller.selectedDate=null;
                        controller.selectedTime=null;
                        controller.selectedDays=null;
                        controller.selectedHours=null;
                        controller.selectedMinutes=null;
                        controller.update();
                      }))
                    ],
                  ),
                  SizedBox(height: 16,),
                  if(!controller.isChecked)Column(children: [
                    ContainerDecorated(padding: 2,
                      child: Row(spacing: 16,children: [
                        Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=0;controller.update();},color: controller.selectedTab==0?Colors.white:null,padding: 8,child: SmallText(text: "Set end date",color: controller.selectedTab==0?Colors.black:Colors.black54,textAlign: TextAlign.center,),)),
                        Expanded(child: ContainerDecorated(onTap: (){controller.selectedTab=1;controller.update();},color:controller.selectedTab==1? Colors.white:null,padding: 8,child: SmallText(text: "Set length",color: controller.selectedTab==1?Colors.black:Colors.black54,textAlign: TextAlign.center,),)),
                      ],),
                    ),
                    SizedBox(height: 16,),
                    if(controller.selectedTab==0)
                      ContainerDecorated(onTap: () async {
                        final scheduledAt = await openDateTimePicker(context);
                        if (scheduledAt != null) {
                          controller.selectedFullDate=scheduledAt.toIso8601String();
                          controller.update();
                          controller.selectedDate=DateFormat('dd MMM yyyy').format(scheduledAt);
                          controller.selectedTime=DateFormat('hh:mm a').format(scheduledAt);
                        }
                      },color: Colors.white,colorBorder: Colors.black12,padding: 0,
                        child: Row(children: [

                          Expanded(
                            child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black12))),padding: EdgeInsets.all(12),child: Row(spacing: 8,children: [
                              SmallText(text: controller.selectedDate??"DD-MM-YYYY",fontWeight: FontWeight.w500,),
                              Expanded(child: SmallText(text: "date",color: Colors.black54,)),
                              Icon(Icons.keyboard_arrow_down_rounded,size: 12,)
                            ],),),
                          ),
                          Expanded(
                            child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black12))),padding: EdgeInsets.all(12),child: Row(spacing: 8,children: [
                              SmallText(text: controller.selectedTime?? "HH:MM",fontWeight: FontWeight.w500,),
                              Expanded(child: SmallText(text: "time",color: Colors.black54,)),
                              Icon(Icons.keyboard_arrow_down_rounded,size: 12,)
                            ],),),
                          ),

                        ],),
                      ),

                    if(controller.selectedTab==1)
                      ContainerDecorated(color: Colors.white,colorBorder: Colors.black12,padding: 0,
                        child: Row(children: [

                          Expanded(
                            child: PopupMenuButton<int>(
                              onSelected: (value) {

                                controller.selectedDays = value;
                                controller.update();

                              },
                              itemBuilder: (context) {
                                return List.generate(
                                  31,
                                      (index) => PopupMenuItem(
                                    value: index + 1,
                                    child: Text("${index + 1} days"),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black12),
                                  ),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    SmallText(
                                      text: "${controller.selectedDays??"0"}",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Expanded(
                                      child: SmallText(
                                        text: "days",
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: PopupMenuButton<int>(
                              onSelected: (value) {

                                controller.selectedHours = value;
                                controller.update();

                              },
                              itemBuilder: (context) {
                                return List.generate(
                                  24,
                                      (index) => PopupMenuItem(
                                    value: index + 1,
                                    child: Text("${index + 1} hours"),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black12),
                                  ),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    SmallText(
                                      text: "${controller.selectedHours??"0"}",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Expanded(
                                      child: SmallText(
                                        text: "hours",
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          Expanded(
                            child: PopupMenuButton<int>(
                              onSelected: (value) {

                                controller.selectedMinutes = value;
                                controller.update();

                              },
                              itemBuilder: (context) {
                                return List.generate(
                                  60,
                                      (index) => PopupMenuItem(
                                    value: index + 1,
                                    child: Text("${index + 1} minutes"),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black12),
                                  ),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    SmallText(
                                      text: "${controller.selectedMinutes??"0"}",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Expanded(
                                      child: SmallText(
                                        text: "minutes",
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Expanded(
                          //   child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black12))),padding: EdgeInsets.all(12),child: Row(spacing: 8,children: [
                          //     SmallText(text: "1",fontWeight: FontWeight.w500,),
                          //     Expanded(child: SmallText(text: "days",color: Colors.black54,)),
                          //     Icon(Icons.keyboard_arrow_down_rounded,size: 12,)
                          //   ],),),
                          // ),
                          // Expanded(
                          //   child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black12))),padding: EdgeInsets.all(12),child: Row(spacing: 8,children: [
                          //     SmallText(text: "0",fontWeight: FontWeight.w500,),
                          //     Expanded(child: SmallText(text: "hours",color: Colors.black54,)),
                          //     Icon(Icons.keyboard_arrow_down_rounded,size: 12,)
                          //   ],),),
                          // ),
                          // Expanded(
                          //   child: Container(padding: EdgeInsets.all(12),child: Row(spacing: 8,children: [
                          //     SmallText(text: "0",fontWeight: FontWeight.w500,),
                          //     Expanded(child: SmallText(text: "minutes",color: Colors.black54,)),
                          //     Icon(Icons.keyboard_arrow_down_rounded,size: 12,)
                          //   ],),),
                          // )
                        ],),
                      ),
                  ],),

                  SizedBox(height: 36,),
                  SmallText(text: "Options",fontWeight: FontWeight.w500,),
                  SizedBox(height: 16,),

                  ReorderableListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.listOption.length,
                    onReorder: controller.reorder,
                    buildDefaultDragHandles: false, // IMPORTANT
                    itemBuilder: (context, index) {
                      return Container(
                        key: ValueKey(index),
                        margin: EdgeInsets.only(bottom: 12),
                        child: Row(spacing: 16, children: [
                          ReorderableDragStartListener(index: index, child: ContainerDecorated(padding: 10, child: Icon(Icons.drag_indicator_rounded),),),
                          Expanded(child: TextFieldCommon(controller: controller.listOption[index], hintText: "Option ${index + 1}",validator: (value){
                            if(value!.isEmpty) return "Write here";
                            return null;
                          },),),
                          InkWell(onTap: (){
                            controller.listOption.removeAt(index);
                            controller.update();
                          },child: Icon(Icons.close))
                        ],),
                      );
                    },
                  ),

                  SizedBox(height: 24),

                  GestureDetector(
                    onTap: controller.addOption,
                    child: Row(spacing: 8, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.add),
                      SmallText(text: "Add more option"),
                    ],),
                  ),

                  SizedBox(height: 48,)
                ],),
              ),
            ),
          ),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonSingleAtom(widget: "Submit",tap: (){
                controller.postData();
              },),
            )
          ],
        );
      }
    );
  }

  String getOnlyDate(String iso) {
    final date = DateTime.parse(iso);
    return DateFormat('dd MMM yyyy').format(date);
  }


  String getOnlyTime(String iso) {
    final date = DateTime.parse(iso);
    return DateFormat('hh:mm a').format(date);
  }



  Future<DateTime?> openDateTimePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date == null) return null;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

}
