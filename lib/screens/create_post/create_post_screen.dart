import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/data_source/data_source_common.dart';
import 'package:civic_force/model/search_user_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/screens/create_post/controller_create_post.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widget/app_bar.dart';
import 'widget/select_location_widget.dart';
import 'package:civic_force/model/tags_model.dart' as tm;



class TagData{
  final String name;
  final String slag;
  final String image;
  TagData(this.name, this.slag, this.image);
}

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key, this.image});
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCreatePost(image: image),
      builder: (controller) {
        return Scaffold(

          appBar: AppBarCommon(title: "Create Post",color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,colorIconTheme: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              //   AnimatedTextField(
              //     controller: controller.textEditingControllerTags,
              //   animationType: Animationtype.slide,
              //   style: TextStyle(fontSize: 12),
              //
              //   decoration: InputDecoration(
              //     hintStyle: TextStyle(fontSize: 12),
              //     isDense: true,
              //     prefixIcon: Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.red, width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(40),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black, width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(40),
              //     ),
              //     contentPadding: EdgeInsets.all(12),
              //   ),
              //   onSubmitted: (value){
              //     if(value.isEmpty) return;
              //     controller.selectedTagList.add(value);
              //     controller.update();
              //     controller.textEditingControllerTags.text="";
              //   },
              //   hintTexts: [
              //     'Search for "Water"',
              //     'Search for "Litter"',
              //     'Search for "Road"',
              //   ],
              // ),
              //   if(controller.selectedTagList.isNotEmpty) SizedBox(height: 16,),
              //   Wrap(spacing: 16,runSpacing: 16,children: [
              //     for(var x in controller.selectedTagList)
              //       ContainerDecorated(color: Colors.transparent,colorBorder: Colors.grey.shade400,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 10,vertical: 6),child: Row(mainAxisSize: MainAxisSize.min,spacing: 8,
              //         children: [
              //           SmallText(text: x),
              //           Icon(Icons.close,size: 16,)
              //         ],
              //       ))
              //   ],),
              //   SizedBox(height: 16,),

                Row(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerDecorated(borderRadius: 30,color: Colors.black,height: 40,width: 40,child: Center(child: SmallText(text: "A",color: Colors.white,fontWeight: FontWeight.w600,size: 14,)),),

                    Expanded(child: Column(spacing: 16,
                      children: [
                        TextField(onTapOutside: (v){
                          hideKeyboard();
                        },controller: controller.textEditingControllerText,decoration: InputDecoration(hintStyle: TextStyle(fontSize: 14),isDense: true,hintText: "What's happening?",border: InputBorder.none),maxLines: 8,minLines: 1,style: TextStyle(fontSize: 14),),

                        if(controller.listSelectedImage.isNotEmpty)Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Wrap(spacing: 8,runSpacing: 8,children: [
                              for(var x in controller.listSelectedImage)Stack(
                                children: [
                                  ImageCommon(borderRadius: 10,src:x,fit: BoxFit.cover,height: getSize(controller),width: getSize(controller),),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                      Container(margin: EdgeInsets.all(4),decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),child: SmallText(color: Colors.white,text: "Edit",fontWeight: FontWeight.w600,)),
                                      Positioned(right: 4,top: 4,
                                        child: InkWell(onTap: (){
                                          controller.listSelectedImage.remove(x);
                                          controller.update();
                                        },child: Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),child: Icon(Icons.close,size: 18,color: Colors.white,))),
                                      ),
                                  //     // ContainerDecorated(child: Icon(Icons.close,size: 18,),borderRadius: 20,)
                                  //   ],),
                                  // ),
                                ],
                              ),
                            ],),


                            InkWell(onTap: (){
                              showDialog(context: context, builder: (builder)=>Dialog(child: SelectLocationWidget(controllerCreatePost: controller,),));
                            },
                              child: Row(spacing: 8,children: [
                                Icon(Icons.add_location_alt_outlined,size: 16,color: Colors.deepOrange,),
                                Expanded(child: SmallText(text: controller.selectedAddress?? "Add location",color: Colors.deepOrange,fontWeight: FontWeight.w500,maxLine: 1,overflow: TextOverflow.ellipsis,)),
                                if(controller.selectedAddress!=null)InkWell(onTap: (){
                                  controller.selectedAddress=null;
                                  controller.latLng=null;
                                  controller.selectedCity=null;
                                  controller.selectedState=null;
                                  controller.selectedCountry=null;
                                  controller.update();
                                },child: Icon(Icons.close,size: 16,))
                              ],),
                            ),


                            InkWell(onTap: (){
                              if(!controller.showOnMapValue){
                                controller.showOnMapValue = !controller.showOnMapValue;
                                controller.update();
                              }
                            },
                              child: Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,children: [
                                SizedBox(height: 16,width: 16,child: Transform.scale(
                                  scale: 0.7, // adjust this factor (0.5 = 50% smaller, 1.0 = normal)
                                  child: Checkbox(fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return Colors.blue; // selected color
                                    }
                                    return Colors.transparent; // unselected color (optional)
                                  }),
                                    value: controller.showOnMapValue,
                                    onChanged: (val) {
                                      controller.showOnMapValue = !controller.showOnMapValue;
                                      controller.update();
                                    },

                                  ),
                                )),
                                Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,
                                    children: [
                                      Row(spacing: 8,
                                        children: [
                                          InkWell(onTap: (){
                                            controller.showOnMapValue = !controller.showOnMapValue;
                                            controller.update();
                                          },child: SmallText(text: "Show on map",color: Colors.blue,fontWeight: FontWeight.w500,)),

                                          InkWell(onTap: () async {

                                            var result=await showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                                  SmallText(text: "Show Images in map??",size: 18,fontWeight: FontWeight.w600,letterSpacing: 0.5,),
                                                  SizedBox(height: 4,),
                                                  SmallText(text: "This will show your image in map publicly",size: 12,fontWeight: FontWeight.w600,letterSpacing: 0.5,color: Colors.black54,),
                                                  SizedBox(height: 8,),
                                                  Image.asset(AppImages.map),
                                                ],),
                                              );
                                            });

                                          },child: Icon(Icons.info_outline,size: 16,color: Colors.blue,))
                                        ],
                                      ),
                                      // if(controller.showOnMapValue)TextField(style: TextStyle(fontSize: 12),decoration: InputDecoration.collapsed(hintText: "Search label here...",hintStyle: TextStyle(fontSize: 12)),),




                                      if(controller.showOnMapValue)ContainerDecorated(colorBorder: Colors.blue.withOpacity(0.2),color: Colors.blue.withOpacity(0.1),padding: 8,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,
                                          children: [
                                            TypeAheadField<tm.Data>(
                                              suggestionsCallback: (search){
                                                return DataSourceCommon().fetchTags(search: controller.textEditingControllerTags.text,hideCount: true);
                                              },
                                              controller: controller.textEditingControllerTags,
                                              hideOnEmpty: true,
                                              hideOnError: true,
                                              hideOnLoading: true,
                                              builder: (context, controllerX, focusNode) {
                                                return TextField(
                                                  onChanged: (value){
                                                    DataSourceCommon().fetchTags(search: controller.textEditingControllerTags.text,hideCount: true);
                                                  },
                                                  style: TextStyle(fontSize: 13),
                                                  onTapOutside: (v){
                                                    hideKeyboard();
                                                  },
                                                    onSubmitted: (value){

                                                      if(value.isNotEmpty){
                                                        controller.selectedTagList.add(value);
                                                        controller.update();
                                                        controller.textEditingControllerTags.text="";
                                                      }
                                                    },
                                                    controller: controllerX,
                                                    focusNode: focusNode,
                                                    autofocus: true,
                                                    decoration: InputDecoration.collapsed(hintText: 'Search tags...',hintStyle: TextStyle(fontSize: 13))
                                                );
                                              },
                                              itemBuilder: (context, city) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: SmallText(text: city.name,fontWeight: FontWeight.w600,),
                                                );
                                                //   ListTile(
                                                //   title: Text(city),
                                                //   // subtitle: Text(city),
                                                // );
                                              },
                                              onSelected: (city) {
                                                controller.textEditingControllerTags.text="";
                                                controller.selectedTagList.add(city.name);
                                                controller.update();
                                              },
                                            ),
                                            if(controller.selectedTagList.isNotEmpty)Wrap(spacing: 8,runSpacing: 8,children: [
                                              for(var x in controller.selectedTagList)
                                                Container(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.grey)),
                                                  child: Row(mainAxisSize: MainAxisSize.min,spacing: 4,
                                                    children: [
                                                      SmallText(text: x,size: 11,color: Colors.black,),
                                                      InkWell(onTap: (){
                                                        controller.selectedTagList.remove(x);
                                                        controller.update();
                                                      },child: Icon(Icons.close,size: 16,color: Colors.black,))
                                                    ],
                                                  ),
                                                )
                                            ],)
                                          ],
                                        ),
                                      ),



                                      // ChipsInput(
                                      //   initialValue: [
                                      //     TagData('John Doe', 'jdoe@flutter.io', 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg')
                                      //   ],
                                      //   decoration: InputDecoration(
                                      //     labelText: "Select People",
                                      //   ),
                                      //   maxChips: 3,
                                      //   findSuggestions: (String query) {
                                      //     if (query.length != 0) {
                                      //       var lowercaseQuery = query.toLowerCase();
                                      //       return mockResults.where((profile) {
                                      //         return profile.name.toLowerCase().contains(query.toLowerCase()) || profile.email.toLowerCase().contains(query.toLowerCase());
                                      //       }).toList(growable: false)
                                      //         ..sort((a, b) => a.name
                                      //             .toLowerCase()
                                      //             .indexOf(lowercaseQuery)
                                      //             .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
                                      //     } else {
                                      //       return const <TagData>[];
                                      //     }
                                      //   },
                                      //   onChanged: (data) {
                                      //     print(data);
                                      //   },
                                      //   chipBuilder: (context, state, profile) {
                                      //     return InputChip(
                                      //       key: ObjectKey(profile),
                                      //       label: Text(profile.name),
                                      //       avatar: CircleAvatar(
                                      //         backgroundImage: NetworkImage(profile.imageUrl),
                                      //       ),
                                      //       onDeleted: () => state.deleteChip(profile),
                                      //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      //     );
                                      //   },
                                      //   suggestionBuilder: (context, state, profile) {
                                      //     return ListTile(
                                      //       key: ObjectKey(profile),
                                      //       leading: CircleAvatar(
                                      //         backgroundImage: NetworkImage(profile.imageUrl),
                                      //       ),
                                      //       title: Text(profile.name),
                                      //       subtitle: Text(profile.email),
                                      //       onTap: () => state.selectSuggestion(profile),
                                      //     );
                                      //   },
                                      // )




                                    ],
                                  ),
                                )
                              ],),
                            ),
                          ],
                        ),


                        // Row(spacing: 24,children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                            Icon(Icons.person,size: 16,color: Colors.black54),
                            // SmallText(text: "Tag people",color: Colors.black54),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(!controller.showUserTag) InkWell(onTap: (){
                                    controller.showUserTag = !controller.showUserTag;
                                    controller.update();
                                  },child: SmallText(text: "Tag people",color: Colors.black54)),
                                  if(controller.showUserTag)TypeAheadField<Data>(
                                    suggestionsCallback: (search){
                                      return DataSourceCommon().fetchUsers(search: controller.textEditingControllerTags.text);
                                    },
                                    controller: controller.textEditingControllerUsers,
                                    hideOnEmpty: true,
                                    hideOnError: true,
                                    hideOnLoading: true,
                                    builder: (context, controllerX, focusNode) {
                                      return TextField(
                                          onChanged: (value){
                                            DataSourceCommon().fetchUsers(search: controller.textEditingControllerTags.text);
                                          },
                                          style: TextStyle(fontSize: 13),
                                          onTapOutside: (v){
                                            hideKeyboard();
                                          },
                                          controller: controllerX,
                                          focusNode: focusNode,
                                          autofocus: true,
                                          decoration: InputDecoration.collapsed(hintText: 'Tags people...',hintStyle: TextStyle(fontSize: 13))
                                      );
                                    },
                                    itemBuilder: (context, data) {
                                      return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(spacing: 8,
                                          children: [
                                            ImageCommon(src: "${data.image}",height: 24,width: 24,fit: BoxFit.cover,borderRadius: 30,),
                                            Expanded(child: SmallText(text: "${data.name}",fontWeight: FontWeight.w600,maxLine: 1,)),
                                          ],
                                        ),
                                      );
                                      //   ListTile(
                                      //   title: Text(city),
                                      //   // subtitle: Text(city),
                                      // );
                                    },
                                    onSelected: (data) {
                                      controller.textEditingControllerUsers.text="";
                                      controller.selectedUserList.add(data);
                                      controller.update();
                                    },
                                  ),

                                  SizedBox(height: 8,),

                                  Wrap(spacing: 8,runSpacing: 8,children: [

                                    for(var x in controller.selectedUserList)
                                      Container(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.grey)),
                                        child: Row(mainAxisSize: MainAxisSize.min,spacing: 4,
                                          children: [
                                            SmallText(text: "${x.name}",size: 11,color: Colors.black,),
                                            InkWell(onTap: (){
                                              controller.selectedUserList.remove(x);
                                              controller.update();
                                            },child: Icon(Icons.close,size: 16,color: Colors.black,))
                                          ],
                                        ),
                                      ),

                                  ],)
                                ],
                              ),
                            ),
                          ],),


                        //
                        //   Row(spacing: 4,children: [
                        //     Icon(Icons.description,size: 16,color: Colors.black54),
                        //     SmallText(text: "Add description",color: Colors.black54,),
                        //   ],)
                        //
                        // ],),
                        //
                        // Row(spacing: 8,children: [
                        //   FaIcon(FontAwesomeIcons.globe,size: 14,color: Colors.blue,),
                        //   SmallText(text: "Everyone can reply",fontWeight: FontWeight.w600,color: Colors.blue,)
                        // ],),


                        Column(children: [
                          Divider(height: 1,),
                          SizedBox(height: 8,),

                          Row(spacing: 16,children: [
                            InkWell(onTap: () async {
                              XFile? xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                              if(xFile!=null){
                                // controller.selectedImage=xFile.path;
                                controller.listSelectedImage.add(xFile.path);
                                controller.update();
                              }
                            },child: Icon(Icons.image,size: 18,)),
                            Icon(Icons.gif_box_outlined,size: 18,),
                            Icon(Icons.emoji_emotions_outlined,size: 18,),
                            Icon(Icons.location_on,size: 18,),
                            Spacer(),
                            ContainerDecorated(height: 24,width: 2,color: Colors.black45,),
                            ContainerDecorated(onTap: () async {

                              controller.postData();

                            },borderRadius: 20,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 6),color: Colors.black,child: controller.apiResponse.status==Status.LOADING?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,)):SmallText(text: "Post",fontWeight: FontWeight.w600,color: Colors.white,),)
                          ],),
                          SizedBox(height: 4,),
                        ],)
                      ],
                    )),
                  ],
                ),
                Divider(),


                SizedBox(height: 400,)
              ],),
            ),
          ),
        );
      }
    );
  }


  getSize(ControllerCreatePost controller){
    return  controller.listSelectedImage.length==1?null:Get.width/3;
  }


}
