import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/project_modules/post/post_main_list_widget.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../project_modules/post/controller_post_list.dart';

class MyPostScreen extends StatelessWidget {
  const MyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPostList(my: true),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "My Posts"),
          body: SmartRefresher(controller: controller.refreshController,
            onRefresh: controller.refreshData,
            onLoading: controller.fetchData,
            enablePullUp: controller.loadMore,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  PostMainListWidget(my: true,)
                ],),
              ),
            ),
          )
        );
      }
    );
  }
}
