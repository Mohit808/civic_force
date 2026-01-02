import 'package:civic_force/dashboard_screen.dart';
import 'package:civic_force/screens/basic_details/basic_details_screen.dart';
import 'package:civic_force/screens/intro_slider_screen/intro_slider_screen.dart';
import 'package:civic_force/screens/map/map_screen.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login/login_screen.dart';
import 'common_widget/app_colors.dart';
import 'common_widget/app_sizes.dart';

Future<void> main() async {
  await Utils().init(colorCode: 0xFF282C35, radius: AppSizes.h_10);
  await Utils().initialize();
  AppUrls.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        primarySwatch: AppColors.materialColor,
      ),
      // home: MapScreen(),
      home:   box.read(Utils.intro)==null?IntroSliderScreen():  box.read(Utils.userToken)==null?LoginScreen(): box.read(Utils.info)==null? BasicDetailsScreen():  DashboardScreen(),

    );
  }
}
