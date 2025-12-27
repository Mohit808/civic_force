import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/data_source/upload_to_s3.dart';
import 'package:civic_force/model/user_model.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/widget/app_bar/app_bar_chat_widget.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/widget/image_chat_widget.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/widget/pdf/pdf_chat_widget.dart';
import 'package:civic_force/project_modules/chat_module/one_to_one/widget/text_chat_widget.dart';
import 'package:civic_force/screens/polls_screen/polls_screen.dart';
import 'package:civic_force/screens/user_profile/user_profile_screen.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../enums/media_type_enum.dart';
import '../../../model/chat_message_model.dart';
import 'controller_one_to_one.dart';
import 'widget/audio/audio_chat_widget.dart';
import 'widget/emoji/emoji_chat_widget.dart';
import 'widget/picker/image_picker_widget.dart';
import 'widget/reply/reply_chat_widget.dart';
import 'widget/video_chat_widget.dart';

class OneToOneScreen extends StatelessWidget {
  const OneToOneScreen({super.key, required this.userId, required this.name, required this.image});
  final dynamic userId;
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerOneToOne(userId: userId),
      builder: (controller) {
        return Scaffold(
          appBar: controller.selectedIndexList.isNotEmpty?AppBarChatWidget(title: "${controller.selectedIndexList.length} selected",):
          AppBarCommon(title: InkWell(onTap: (){
            Get.to(()=>UserProfileScreen(userId: userId,name: name,image: image,));
          },
            child: Row(spacing: 16,
              children: [
                ImageCommon(image,sizeAndCircle: 40,),
                Expanded(child: SmallText(text: "$name",size: 18,fontWeight: FontWeight.w600,)),
              ],
            ),
          ),centerTitle: false,),
          body: Column(children: [


            Expanded(
              child: ListView.separated(reverse: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                return Column(
                  children: [
                    if(controller.loadMore && index==controller.list.length-1) ContainerDecorated(onTap: (){controller.fetchData();},marginEdgeInsets: EdgeInsets.only(bottom: 16,top: 16),borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: SmallText(text: "Load more")),


                    SwipeTo(swipeSensitivity: 5,rightSwipeWidget: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.reply),
                    ),

                      onLeftSwipe: "${controller.list[index].sender}"=="${userInfo?.userId}"?null:(value){
                      controller.setReply(index);
                      },
                      onRightSwipe: "${controller.list[index].sender}"!="${userInfo?.userId}"?null: (value){
                      controller.setReply(index);
                    },
                      child: InkWell(onTap: (){
                        if(controller.selectedIndexList.isEmpty){
                          hideKeyboard();
                          controller.isEmojiShowing=false;
                          controller.update();
                        }else{
                          if(controller.selectedIndexList.contains(index)){
                            controller.selectedIndexList.remove(index);
                          }else{
                            controller.selectedIndexList.add(index);
                          }
                          controller.update();
                        }
                      },onLongPress: (){
                        controller.selectedIndexList.contains(index)?controller.selectedIndexList.remove(index):controller.selectedIndexList.add(index);
                        controller.update();
                      },
                        child: Container(color: controller.selectedIndexList.contains(index)? Colors.green.withOpacity(0.2):null,padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(mainAxisAlignment: "${controller.list[index].sender}"=="${userInfo?.userId}"?MainAxisAlignment.end:MainAxisAlignment.start,children: [
                            Column(crossAxisAlignment:  "${controller.list[index].sender}"=="${userInfo?.userId}"?CrossAxisAlignment.end:CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  constraints: BoxConstraints(maxWidth: Get.width-150),
                                  decoration: BoxDecoration(color: "${controller.list[index].sender}"=="${userInfo?.userId}"?AppColors.primary:Colors.grey.shade200,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(20),topLeft: Radius.circular("${controller.list[index].sender}"=="${userInfo?.userId}"?16:0),topRight: Radius.circular("${controller.list[index].sender}"=="${userInfo?.userId}"?0:16))),
                                  child:

                                  Column(crossAxisAlignment: CrossAxisAlignment.end,children: [

                                    if(controller.list[index].replyId!=null)ReplyChatWidget(userId: controller.list[index].sender,name: "${controller.list[index].replyUser}"=="${userInfo?.userId}"?"You":"$name",text: controller.list[index].replyText,),

                                    controller.list[index].mediaType=="text"? TextChatWidget(userId: controller.list[index].sender,message: controller.list[index].message,) :
                                    controller.list[index].mediaType==MediaType.video.value?VideoChatWidget(url: controller.list[index].mediaUrl,disable:  controller.selectedIndexList.isNotEmpty,):
                                    controller.list[index].mediaType==MediaType.pdf.value?PdfChatWidget(userId: controller.list[index].sender,url: controller.list[index].mediaUrl,index: index,size: controller.list[index].mediaSize,disable: controller.selectedIndexList.isNotEmpty,):
                                    controller.list[index].mediaType==MediaType.audio.value?AudioChatWidget(userId: controller.list[index].sender,url: controller.list[index].mediaUrl,index: index,disable: controller.selectedIndexList.isNotEmpty,):

                                    ImageChatWidget(image: controller.list[index].mediaUrl,),

                                    Padding(
                                      padding: const EdgeInsets.only(right: 8,bottom: 4,left: 8,top: 4),
                                      child: Wrap(spacing: 4,
                                        children: [
                                          SmallText(text: timeAgo(controller.list[index].createdAt),color: Colors.white70,size: 12,),
                                          Icon(Icons.check,color: Colors.white70,size: 12,)
                                        ],
                                      ),
                                    )
                                  ],)

                                ),

                                if(controller.list[index].id==null)SizedBox(height: 12,width: 12,child: CircularProgressIndicator(strokeWidth: 1,)),


                              ],
                            )
                          ],),
                        ),
                      ),
                    ),
                  ],
                );
              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 16,); },),
            ),



            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end,spacing: 16,children: [
                Expanded(child: ContainerDecorated(padding: 0,borderRadius: 24,color: Color(0xFFD3D3DD),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(controller.replyId!=null)Container(margin: EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(12)),
                        child: Container(margin: EdgeInsets.only(left: 8),padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),color: Color(0xFFB7B7C5)),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,children: [
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                                SmallText(text: "${"${controller.replyUser}"=="${userInfo?.userId}"?"You":name}",fontWeight: FontWeight.w500,size: 15,),
                                SmallText(text: "${controller.replyText}",color: Colors.black54,fontWeight: FontWeight.w500,),
                              ],),
                            ),
                            InkWell(onTap: (){
                              controller.replyId=null;
                              controller.replyText=null;
                              controller.replyUser=null;
                              controller.update();
                            },child: Icon(Icons.close))
                          ],),
                        ),
                      ),
                      TextFieldCommon(
                        prefixIcon: InkWell(onTap: (){
                          controller.isEmojiShowing=!controller.isEmojiShowing;
                          controller.update();
                        },child: Icon(Icons.emoji_emotions_outlined)),
                        suffixIcon: InkWell(onTap: (){
                        showModalBottomSheet(showDragHandle: true,context: context, builder: (builder)=>ImagePickerWidget()).then((onValue) async {
                          controller.uploadMultipleFile(onValue);
                        });
                      },child: Icon(Icons.attach_file_outlined)),onTap: (){
                        controller.isEmojiShowing=false;
                        controller.update();
                      },onTapOutside: (){
                      },controller: controller.textEditingController,hintText: "Write message...",borderRadius: 30,fillColor: Colors.transparent,BorderColor: Colors.transparent,),
                    ],
                  ),
                )),
                ContainerDecorated(onTap: (){
                  if(controller.textEditingController.text.trim().isEmpty) return;
                  String message= controller.textEditingController.text.trim();
                  controller.sendMessage(message: message,mediaType: "text");
                },padding: 8,borderRadius: 30,color: AppColors.primary,child: ImageCommon( AppImages.message,color: Colors.white,height: 24,width: 24,))
              ],),
            ),


            EmojiChatWidget()

          ],),
        );
      }
    );
  }
}
