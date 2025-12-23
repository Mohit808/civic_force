import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common_widget/app_bar.dart';
import '../../../project_modules/post/controller_post_list.dart';
import '../../../project_modules/post/post_main_list_widget.dart';

class SavedPostScreen extends StatelessWidget {
  const SavedPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerPostList(saved: true),
        builder: (controller) {
          return Scaffold(
              appBar: AppBarCommon(title: "Saved Posts"),
              body: SmartRefresher(controller: controller.refreshController,
                onRefresh: controller.refreshData,
                onLoading: controller.fetchData,
                enablePullUp: controller.loadMore,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      PostMainListWidget(saved: true,)
                    ],),
                  ),
                ),
              )
          );
        }
    );
  }
}
