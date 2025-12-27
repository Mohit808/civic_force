import 'package:flutter/material.dart';

import '../../../common_widget/text_common.dart';

class PrivacyItemWidget extends StatelessWidget {
  const PrivacyItemWidget({super.key, this.heading, this.description, this.defaultValue});
  final dynamic heading;
  final dynamic description;
  final dynamic defaultValue;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,
      children: [
        Row(spacing: 8,
          children: [
            Expanded(child: SmallText(text: "$heading",fontWeight: FontWeight.w500,size: 16,)),
            if(defaultValue!=null)SmallText(text: "$defaultValue",size: 13,fontWeight: FontWeight.w500,color: Colors.black54,),
            Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Colors.black54,),
          ],
        ),
        Row(spacing: 16,
          children: [

            SmallText(text: "$description",color: Colors.black54,size: 13,),
          ],
        )
      ],
    );
  }
}
