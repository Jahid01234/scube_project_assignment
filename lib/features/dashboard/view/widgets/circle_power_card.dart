import 'package:flutter/material.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';

class CirclePowerCard extends StatelessWidget {
  const CirclePowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xff398FC9),
          width: 20,
        ),
      ),
      child: Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Power",
                style: globalTextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getHeight(2)),
              Text(
                "5.53 kw",
                style: globalTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
