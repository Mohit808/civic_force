import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_chat_list.dart';
import 'one_to_one/one_to_one_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerChatList(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: SmallText(text: "Chats",fontWeight: FontWeight.w600,),centerTitle: false,actions: [
            Icon(Icons.call),
            SizedBox(width: 16,)
          ],),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(spacing: 24,children: [

              ListView.builder(itemCount: controller.list.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                return InkWell(onTap: (){
                  Get.to(()=>OneToOneScreen(userId: controller.list[index].userId,name: controller.list[index].name,image: controller.list[index].image,));
                },
                  child: Row(spacing: 16,
                    children: [
                      ImageCommon( "${controller.list[index].image}",height: 50,width: 50,borderRadius: 50,),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
                          children: [
                            Row(
                              children: [
                                Expanded(child: SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w600,size: 16,)),
                                SmallText(text: formatDateRelative(controller.list[index].lastMessageTime),size: 13,color: Colors.green,fontWeight: FontWeight.w500,),
                              ],
                            ),
                            Row(spacing: 8,
                              children: [
                                Icon(controller.list[index].lastMessageByYou==true? Icons.arrow_upward_rounded:Icons.arrow_downward_rounded,size: 20,),
                                Expanded(child: SmallText(text: "${controller.list[index].lastMessage}",maxLine: 1,)),
                                if(controller.list[index].unreadCount!=null && controller.list[index].unreadCount!=0)ContainerDecorated(color: Colors.green,borderRadius: 30,height: 24,width: 24,child: Center(child: SmallText(text: "${controller.list[index].unreadCount}",color: Colors.white,size: 12,fontWeight: FontWeight.w600,)))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })

            ],),
          ),
        );
      }
    );
  }
}



String formatDateRelative(String? isoUtc) {
  if (isoUtc == null || isoUtc.trim().isEmpty) return "";

  DateTime dtUtc;
  try {
    dtUtc = DateTime.parse(isoUtc);
  } catch (e) {
    return isoUtc;
  }

  // convert to local time
  final DateTime dtLocal = dtUtc.toLocal();

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateOnly = DateTime(dtLocal.year, dtLocal.month, dtLocal.day);

  String formatTime(DateTime dt) {
    int hour = dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = hour >= 12 ? 'PM' : 'AM';
    if (hour == 0) {
      hour = 12; // Midnight
    } else if (hour > 12) {
      hour -= 12;
    }
    return '$hour:$minute $ampm';
  }

  final timeString = formatTime(dtLocal);

  if (dateOnly == today) return timeString;
  if (dateOnly == today.subtract(const Duration(days: 1))) return 'Yesterday';

  // fallback for other dates
  String two(int n) => n.toString().padLeft(2, '0');
  final day = two(dtLocal.day);
  final month = two(dtLocal.month);
  final year = two(dtLocal.year % 100);

  return '$day/$month/$year';
}