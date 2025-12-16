import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/icons_path.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
     this.title,
    this.centerTitle = true,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
        onPressed: () => Get.back(),
      )
          : null,
      centerTitle: centerTitle,
      title: Text(
        title ?? "SCM",
        style: globalTextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: actions ??
          [
             Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset(IconsPath.notification,height: 20,),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}