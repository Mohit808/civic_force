import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
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



class TagData{
  final String name;
  final String slag;
  final String image;
  TagData(this.name, this.slag, this.image);
}

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});

  List mockResults=[
    TagData('John Doe', 'jdoe@flutter.io', 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
    TagData('Abhinav Doe', 'jdoe@flutter.io', 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
    TagData('Abhishek Doe', 'jdoe@flutter.io', 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
    TagData('Rahul Doe', 'jdoe@flutter.io', 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    mockResults=[];
    return GetBuilder(init: ControllerCreatePost(),
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
                        if(controller.selectedImage!=null)Stack(
                          children: [
                            Column(spacing: 8,
                              children: [
                                ImageCommon(borderRadius: 10,src:controller.selectedImage?? "https://images.unsplash.com/photo-1747021627449-945b5723ddbe?q=80&w=1064&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                Row(spacing: 8,children: [
                                  Icon(Icons.add_location_alt_outlined,size: 16,color: Colors.deepOrange,),
                                  SmallText(text: "Add location",color: Colors.deepOrange,fontWeight: FontWeight.w500,)
                                ],),


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
                                          InkWell(onTap: (){
                                            controller.showOnMapValue = !controller.showOnMapValue;
                                            controller.update();
                                          },child: SmallText(text: "Show on map",color: Colors.blue,fontWeight: FontWeight.w500,)),
                                          // if(controller.showOnMapValue)TextField(style: TextStyle(fontSize: 12),decoration: InputDecoration.collapsed(hintText: "Search label here...",hintStyle: TextStyle(fontSize: 12)),),




                                          if(controller.showOnMapValue)ContainerDecorated(colorBorder: Colors.blue.withOpacity(0.2),color: Colors.blue.withOpacity(0.1),padding: 8,
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 8,
                                              children: [
                                                TypeAheadField<String>(
                                                  suggestionsCallback: (search){
                                                    return ["Hello","hi","bye"];
                                                  },
                                                  builder: (context, controller, focusNode) {
                                                    return TextField(
                                                      style: TextStyle(fontSize: 13),
                                                      onTapOutside: (v){
                                                        hideKeyboard();
                                                      },
                                                        controller: controller,
                                                        focusNode: focusNode,
                                                        autofocus: true,
                                                        decoration: InputDecoration.collapsed(hintText: 'Search tags...',hintStyle: TextStyle(fontSize: 13))
                                                    );
                                                  },
                                                  itemBuilder: (context, city) {
                                                    return Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: SmallText(text: city,fontWeight: FontWeight.w600,),
                                                    );
                                                    //   ListTile(
                                                    //   title: Text(city),
                                                    //   // subtitle: Text(city),
                                                    // );
                                                  },
                                                  onSelected: (city) {
                                                    controller.selectedTagList.add(city);
                                                    controller.update();
                                                    // Navigator.of(context).push<void>(
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) => CityPage(city: city),
                                                    //   ),
                                                    // );
                                                  },
                                                ),
                                                if(controller.selectedTagList.isNotEmpty)Wrap(spacing: 8,runSpacing: 8,children: [
                                                  for(var x in controller.selectedTagList)
                                                    ContainerDecorated(color: Colors.black,borderRadius: 30,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                                      child: Row(mainAxisSize: MainAxisSize.min,spacing: 4,
                                                        children: [
                                                          SmallText(text: x,size: 11,color: Colors.white,),
                                                          InkWell(onTap: (){
                                                            controller.selectedTagList.remove(x);
                                                            controller.update();
                                                          },child: Icon(Icons.close,size: 16,color: Colors.white,))
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),child: SmallText(color: Colors.white,text: "Edit",fontWeight: FontWeight.w600,)),
                                InkWell(onTap: (){
                                  controller.selectedImage=null;
                                  controller.update();
                                },child: Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),child: Icon(Icons.close,size: 18,color: Colors.white,))),
                                // ContainerDecorated(child: Icon(Icons.close,size: 18,),borderRadius: 20,)
                              ],),
                            ),
                          ],
                        ),


                        // Row(spacing: 24,children: [
                          Row(spacing: 4,children: [
                            Icon(Icons.person,size: 16,color: Colors.black54),
                            SmallText(text: "Tag people",color: Colors.black54),
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
                                controller.selectedImage=xFile.path;
                                controller.update();
                              }
                            },child: Icon(Icons.image,size: 18,)),
                            Icon(Icons.gif_box_outlined,size: 18,),
                            Icon(Icons.emoji_emotions_outlined,size: 18,),
                            Icon(Icons.location_on,size: 18,),
                            Spacer(),
                            ContainerDecorated(height: 24,width: 2,color: Colors.black45,),
                            ContainerDecorated(onTap: () async {
                              if(controller.selectedImage!=null){

                                var result=await showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                                  return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SmallText(text: "Show Images in map??",size: 18,fontWeight: FontWeight.w600,letterSpacing: 0.5,),
                                    ),
                                    Image.asset(AppImages.map),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(spacing: 16,children: [
                                        Expanded(child: ButtonSingleAtom(widget: "No",tap: (){
                                          Get.back();
                                          controller.postData();
                                          },)),
                                        Expanded(child: ButtonSingleAtom(widget: "Yes",tap: (){

                                          Get.back(result: true);
                                          controller.postData();
                                          },)),
                                      ],),
                                    )
                                  ],);
                                });
                              }else {
                                if(controller.textEditingControllerText.text.isNotEmpty) controller.postData();
                              }

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


}
