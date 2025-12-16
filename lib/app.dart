import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/routes/routes.dart';

class ScubeAssignmentApp extends StatelessWidget {
  const ScubeAssignmentApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
        title: 'Scube App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBgColor
        ),
        initialRoute: AppRoutes.login,
        getPages: AppRoutes.routes,
    );
  }
}