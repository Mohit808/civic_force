import 'package:civic_force/dashboard_screen.dart';
import 'package:civic_force/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_widget/app_colors.dart';
import 'common_widget/app_sizes.dart';

void main() {
  Utils().init(colorCode: 0xFF282C35, radius: AppSizes.h_10);
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
      home: DashboardScreen(),
    );
  }
}
