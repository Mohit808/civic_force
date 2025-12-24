import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/screens/search/widgets/search_account_widget.dart';
import 'package:civic_force/screens/search/widgets/search_post_widget.dart';
import 'package:civic_force/screens/search/widgets/search_trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'controller_search.dart';
import 'widgets/search_places_widget.dart';
import 'widgets/search_tab_widget.dart';
import 'widgets/search_tags_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: TextFieldCommon(onChanged: (value){
            controller.update();
            controller.refreshData();
          },controller: controller.textEditingController,hintText: "Search here",borderRadius: 30,),color: AppColors.scaffoldBackgroundColor,colorIconTheme: Colors.black,),
          body: SmartRefresher(controller: controller.refreshController,
            onRefresh: controller.refreshData,
            onLoading: controller.fetchData,
            enablePullUp: controller.loadMore,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SearchTabWidget(),
                    if(controller.apiResponse.status==Status.LOADING)Center(child: CircularProgressIndicator()),
                    if(controller.selectedTab==0 && controller.textEditingController.text.isEmpty)SearchTrendingWidget(),
                    if((controller.selectedTab==0 && controller.textEditingController.text.isNotEmpty) || controller.selectedTab==1)SearchAccountWidget(),
                    if(controller.selectedTab==2)SearchTagsWidget(),
                    if(controller.selectedTab==3 )SearchPlacesWidget(),
                  ],),
                ),
                if(controller.selectedTab==0  && controller.textEditingController.text.isEmpty )Container(decoration: BoxDecoration(gradient: LinearGradient(begin: AlignmentGeometry.topCenter,end: AlignmentGeometry.bottomCenter,colors: [
                  Colors.white,
                  // Colors.white,
                  // Colors.black,
                  Colors.black
                ])),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchPostWidget(),
                      SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SmallText(text: "Let's change our",size: 35,fontWeight: FontWeight.w600,color: Colors.white60,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,bottom: 16),
                        child: SmallText(text: "Social Fabric",size: 65,fontWeight: FontWeight.w800,color: Colors.white,),
                      ),
                    ],
                  ),
                ),





              ],),
            ),
          ),
        );
      }
    );
  }
}
