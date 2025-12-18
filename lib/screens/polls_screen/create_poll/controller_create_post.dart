import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerCreatePost extends GetxController{

  TextEditingController textEditingControllerQuestion=TextEditingController();
  int selectedTab=0;
  bool isChecked=false;
  bool isMultiple=false;
  GlobalKey<FormState> formKey=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);

  String? selectedDate;
  String? selectedTime;
  int? selectedDays;
  int? selectedHours;
  int? selectedMinutes;

  String? selectedFullDate;

  List<TextEditingController> listOption = [
    TextEditingController(),
  ];

  void addOption() {
    if(listOption.length>20) {
      showToast("Max option reached");
      return;
    }
    listOption.add(TextEditingController());
    update();
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final item = listOption.removeAt(oldIndex);
    listOption.insert(newIndex, item);
    update();
  }


  @override
  void onInit() {
    super.onInit();
  }

  String parseToIsoString({
    required int days,
    required int hours,
    required int minutes,
  }) {
    return DateTime.now().add(Duration(days: days, hours: hours, minutes: minutes)).toIso8601String();
  }

  postData() async {
    if(!formKey.currentState!.validate()) return;

    if(selectedTab==1){
      selectedFullDate=DateTime.now().add(Duration(days: selectedDays??0, hours: selectedHours??0, minutes: selectedMinutes??0)).toIso8601String();
    }
    apiResponse=ApiResponse(status: Status.LOADING);
    update();


    var res=await NetworkManager().post(AppUrls.poll,data: {
      "question": textEditingControllerQuestion.text,
      "is_multiple_choice": isMultiple,
      "expires_at": isChecked?null: selectedFullDate,
      "options": listOption.map((toElement)=>toElement.text).toList()
    });
    print(res);
    ModelX modelX=ModelX.fromJson(res);
    if(modelX.status==200){
      showToastSuccess(modelX.message);
      Get.back();
    }else{
      showToastError(modelX.message);
    }

    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();


  }


}