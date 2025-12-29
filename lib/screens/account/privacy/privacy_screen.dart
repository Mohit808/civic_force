import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/screens/account/privacy/privacy_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../project_modules/contacts/contacts_screen.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Privacy"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(spacing: 16,crossAxisAlignment: CrossAxisAlignment.start,children: [
          SizedBox(),
          PrivacyItemWidget(heading: "Stories Privacy",description: "Restrict stories",defaultValue: "Public",),
          Divider(),
          PrivacyItemWidget(heading: "Post Privacy",description: "Restrict post",defaultValue: "Public",),
          Divider(),
          PrivacyItemWidget(heading: "Account Type",description: "Restrict stories, posts, message",defaultValue: "Public",),
          Divider(),
          PrivacyItemWidget(heading: "Tags and mentions",description: "Manage tagging and mentions",defaultValue: "Everyone",),

          Divider(),
          InkWell(onTap: (){
            Get.to(()=>ContactsScreen());
          },child: PrivacyItemWidget(heading: "My Contacts",description: "View, add, delete contacts",)),
          Divider(),
          PrivacyItemWidget(heading: "Blocked Contacts",description: "Manage blocked contacts",),
          Divider(),
          PrivacyItemWidget(heading: "Show on map Guideline",description: "Guideline, terms of uses",),
          Divider(),

        ],),
      ),
    );
  }
}
