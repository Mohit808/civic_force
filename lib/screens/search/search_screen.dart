import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/screens/search/widgets/search_account_widget.dart';
import 'package:civic_force/screens/search/widgets/search_post_widget.dart';
import 'package:civic_force/screens/search/widgets/search_trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          appBar: AppBarCommon(leadingWidth: 30,leading: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8),
            child: InkWell(onTap: (){
              Get.back();
            },child: Icon(Icons.arrow_back)),
          ),title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldCommon(hintText: "Search here",borderRadius: 30,),
          ),color: AppColors.scaffoldBackgroundColor,colorIconTheme: Colors.black,),
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  SearchTabWidget(),
                  if(controller.selectedTab==0)SearchTrendingWidget(),
                  if(controller.selectedTab==0 || controller.selectedTab==1)SearchAccountWidget(),
                  if(controller.selectedTab==2)SearchTagsWidget(),
                  if(controller.selectedTab==3)SearchPlacesWidget(),
                ],),
              ),
              if(controller.selectedTab==0)SearchPostWidget(),
              SizedBox(height: 50,)



            ],),
          ),
        );
      }
    );
  }
}
