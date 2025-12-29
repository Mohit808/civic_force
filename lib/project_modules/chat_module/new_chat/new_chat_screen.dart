import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:civic_force/project_modules/contacts/contact_invite/contact_invite_screen.dart';
import 'package:civic_force/project_modules/contacts/contacts_on_app/contacts_on_app_screen.dart';
import 'package:flutter/material.dart';

import '../../contacts/mutual/contact_mutual_screen.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "New chat"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            TextFieldCommon(hintText: "Search here..."),
            SizedBox(height: 16,),
            ContactMutualScreen(),
            ContactsOnAppScreen(),
            ContactInviteScreen(),

          ],),
        ),
      ),
    );
  }
}
