import 'package:flutter/material.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/const/images_path.dart';
import 'package:scube_assignment/core/global_widgets/custom_app_bar_widget.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';

class MenuItemDetailsScreen extends StatelessWidget {
  const MenuItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.containerBorderColor,
              width: 1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.emptyImg,
                  height: 193,
                  //width: 24,
                ),
                SizedBox(width: getWidth(12)),
                SizedBox(height: getHeight(16)),
                Text(
                  "No data is here,\nplease wait.",
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 14,
                    color: Color(0xff5E5E5E),
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
