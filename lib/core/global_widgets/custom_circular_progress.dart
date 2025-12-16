import 'package:flutter/material.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomCircularProgress extends StatelessWidget {
  final double spentAmount;
  final double totalBudget;
  final String title;
  final bool showOnlyAmount;
  final String? customModifierText;

  const CustomCircularProgress({
    super.key,
    required this.spentAmount,
    required this.totalBudget,
    required this.title,
    this.showOnlyAmount = false,
    this.customModifierText,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (spentAmount / totalBudget * 100).clamp(0.0, 100.0);

    return Center(
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: percentage,
        appearance: CircularSliderAppearance(
          size: 160,
          startAngle: 140,
          angleRange: 260,
          customWidths: CustomSliderWidths(
            trackWidth: 14,
            progressBarWidth: 14,
            handlerSize: 0,
          ),
          customColors: CustomSliderColors(
            trackColor: Color(0xff55B4FF).withOpacity(0.15),
            progressBarColor: AppColors.appPrimaryColor,
            hideShadow: true,
          ),
          infoProperties: InfoProperties(
            mainLabelStyle: globalTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            bottomLabelStyle: globalTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            modifier: (double value) {
              if (customModifierText != null) {
                return customModifierText!;
              }
              if (showOnlyAmount) {
                return spentAmount.toInt().toString();
              }
              return spentAmount.toStringAsFixed(2);
            },
            bottomLabelText: title,
          ),
        ),
      ),
    );
  }
}