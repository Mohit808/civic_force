import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

import '../privacy/privacy_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(spacing: 16,children: [
          SizedBox(),
          PrivacyItemWidget(heading: "Notification",description: "Manage notification",),
          Divider(),
          PrivacyItemWidget(heading: "Sessions",description: "Restrict stories",),
          Divider(),
          PrivacyItemWidget(heading: "Sessions",description: "Restrict stories",),
          Divider(),
          PrivacyItemWidget(heading: "Delete Account",description: "Permanently remove account",),

        ],),
      ),
    );
  }
}
