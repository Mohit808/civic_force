import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/project_modules/contacts/contacts_on_app/contacts_on_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_invite/contact_invite_screen.dart';
import 'controller_contacts.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerContacts(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Contacts"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(spacing: 16,children: [

                ContactsOnAppScreen(),
                ContactInviteScreen()

              ],),
            ),
          ),
        );
      }
    );
  }
}
