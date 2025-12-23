import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/project_modules/post/controller_post_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/text_common.dart';
import '../../screens/shimmer/shimmer_post.dart';
import '../city/city_main_widget.dart';
import 'item_widget/post_item_widget.dart';
import '../../network_handling/api_response.dart';
import '../../network_handling/network_widgets/no_data_widget.dart';
import '../../network_handling/network_widgets/something_went_wrong_widget.dart';
import '../../model/post_model.dart';

class PostMainListWidget extends StatelessWidget {
  const PostMainListWidget({super.key, this.listReceived, this.tag, this.showCity, this.city, this.tags, this.userId, this.my, this.saved,});
  final List<Data>? listReceived;
  final String? tag;
  final bool? showCity;
  final String? city;
  final String? tags;
  final String? userId;
  final dynamic my;
  final dynamic saved;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(tag: tag,init: ControllerPostList(listReceived: listReceived,city: city,tags: tags,userId: userId,my: my,saved: saved),builder: (controller){
      return controller.apiResponse.status==Status.LOADING?ShimmerPost():
      controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,):
      controller.list.isEmpty?NoDataWidget():
      listReceived!=null && listReceived!.isEmpty?NoDataWidget():

      ListView.separated(shrinkWrap: true,itemCount: listReceived?.length?? controller.list.length,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
        return Column(mainAxisSize: MainAxisSize.min,
          children: [
            PostItemWidget(data: listReceived?[index]??  controller.list[index]),
            if(showCity==true && index==5)Column(children: [
              SizedBox(height: 24,),
              Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Heard by city",fontWeight: FontWeight.w600,size: 16,),
                    SmallText(text: "City wise data",color: Colors.black54,),
                  ],),
                ),
                SmallText(text: "View All >",fontWeight: FontWeight.w800,textDecoration: TextDecoration.underline,)
              ],),
              SizedBox(height: 24,),
              CityMainWidget(),
            ],)
          ],
        );
      }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 48,); },);

    });

  }
}
