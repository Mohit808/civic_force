import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "title"),
      body: Column(children: [
        SmallText(text: "text"),
      ],),

    );
  }
}
