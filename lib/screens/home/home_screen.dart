import 'package:civic_force/project_modules/city/city_main_widget.dart';
import 'package:civic_force/project_modules/post/controller_post_list.dart';
import 'package:civic_force/screens/home/controller_home.dart';
import 'package:civic_force/story/story_main_widget.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/app_colors.dart';
import '../../common_widget/text_common.dart';
import '../../project_modules/post/post_main_list_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerHome(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarCommon(title: SmallText(text: "Social Fabric",fontWeight: FontWeight.w800,size: 20,color: Colors.black,),color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: AppColors.primary,centerTitle: false,actions: [
              Image.asset(AppImages.message,height: 30,width: 30,),
              SizedBox(width: 16,)
            ],),
            body: GetBuilder(init: ControllerPostList(),
              builder: (controllerPostItemList) {
                return SmartRefresher(controller: controllerPostItemList.refreshController,
                  enablePullUp: controllerPostItemList.loadMore,
                  onRefresh: controllerPostItemList.refreshData,
                  onLoading: controllerPostItemList.fetchData,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalHeadingText(text: "Story",letterSpacing: 2,size: 16,),
                          SizedBox(height: 8,),
                          StoryMainWidget(),
                          SizedBox(height: 24,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalHeadingText(text: "Feed",letterSpacing: 2,size: 16,),
                              SizedBox(height: 16,
                                child: PopupMenuButton(onSelected: (value){
                                  // controller.changeLayout();
                                },iconSize: 16,itemBuilder: (BuildContext context) { return [
                                  PopupMenuItem(value: "value",child: SmallText(text: "Change layout",),)
                                ]; },child: Icon(Icons.more_vert_rounded,size: 16,),),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          PostMainListWidget(showCity: true,),
                        ],
                      ),
                    ),
                  ),
                );
              }
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