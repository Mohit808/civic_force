import 'package:civic_force/controller_dashboard.dart';
import 'package:civic_force/screens/create_post/create_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_widget/text_common.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerDashboard(),
      builder: (controller) {
        return Scaffold(

          body: controller.list[controller.currentIndex],

          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            color: Color(0xFF282C35),
            elevation: 10,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
                    children: [
                      InkWell(onTap: (){ controller.currentIndex = 0;controller.update();},child: Icon(Icons.home, color: controller.currentIndex == 0 ? Colors.deepOrangeAccent : Colors.blueGrey)),
                      SmallText(text: "Home",color: controller.currentIndex == 0 ? Colors.deepOrangeAccent : Colors.blueGrey,)
                    ],
                  ),

                  Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
                    children: [
                      InkWell(onTap: (){controller.currentIndex = 1;controller.update();},child: Icon(Icons.map_outlined, color: controller.currentIndex == 1 ? Colors.deepOrangeAccent : Colors.blueGrey)),
                      SmallText(text: "Map",color: controller.currentIndex == 1 ? Colors.deepOrangeAccent : Colors.blueGrey,)
                    ],
                  ),

                  SizedBox(width: 48), // space for FAB

                  Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
                    children: [
                      InkWell(onTap: (){controller.currentIndex = 2;controller.update();},child: Icon(Icons.trending_up, color: controller.currentIndex == 2 ? Colors.deepOrangeAccent : Colors.blueGrey)),
                      SmallText(text: "Analysis",color: controller.currentIndex == 2 ? Colors.deepOrangeAccent : Colors.blueGrey,)
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
                    children: [
                      InkWell(onTap: (){controller.currentIndex = 3;controller.update();},child: Icon(Icons.account_circle_rounded, color: controller.currentIndex == 3 ? Colors.deepOrangeAccent : Colors.blueGrey)),
                      SmallText(text: "Account",color: controller.currentIndex == 3 ? Colors.deepOrangeAccent : Colors.blueGrey,)
                    ],
                  ),

                ],
              ),
            ),
          ),

          floatingActionButton: FloatingActionButton(elevation: 10,
            onPressed: () {
              Get.to(()=>CreatePostScreen());
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.add, size: 30),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        );
      }
    );
  }
}
