import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

import '../network_handling/network_manager.dart';
import '../project_modules/contacts/widget/consent_page.dart';
import '../utils/app_urls.dart';

class DataSourceContacts{
  askContacts() async {

    Future.delayed(Duration(seconds: 1)).then((onValue){
      showDialog(context: Get.context!, builder: (builder){
        return Dialog(backgroundColor: Color(0xFF343534),child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConsentPage(),
        ),);
      });
    });
  }

  uploadContacts() async {
    try{
      // if(box.read(Utils.contact)!=null) return;
      List<Map<String,String>> list=[];
      if (await FlutterContacts.requestPermission()){
        List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true,);
        for(var x in contacts){
          print(x.name);
          print(x.displayName);
          print(x.phones.first.number);
          if(x.phones.isNotEmpty)list.add({"name":x.displayName,"number":x.phones.first.number.replaceAll(" ", "")});
        }
      }
      print(list);
      if(list.isNotEmpty){
        var res=await NetworkManager().post(AppUrls.contact,data: {
          "contacts":list
        });
        // box.write(Utils.contact, "true");
        print(res);
      }

    }catch(e){}
  }
}