import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/global_widgets/custom_circular_progress.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/power_consumtion/controller/power_consumption_history_controller.dart';
import 'package:scube_assignment/features/power_consumtion/model/energy_data.dart';
import 'package:scube_assignment/features/power_consumtion/view/custom_date_data_screen.dart';
import 'package:scube_assignment/features/power_consumtion/view/revenue_screen.dart';
import 'package:scube_assignment/features/power_consumtion/view/today_data_screen.dart';

class DataViewScreen extends StatelessWidget {
  DataViewScreen({super.key});
  final PowerConsumptionController controller = Get.put(PowerConsumptionController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCircularProgress(spentAmount: 57.00, totalBudget: 100.00,title: "kWh/Sqft",),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => _buildToggleButton(
                  'Today Data',
                  controller.isTodayData.value,
                      () => controller.toggleTodayDataView(),
                )),
                const SizedBox(width: 20),
                Obx(() => _buildToggleButton(
                  'Custom Date Data',
                  !controller.isTodayData.value,
                      () => controller.toggleTodayDataView(),
                )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 🔹 CONTENT CONTAINER (SCREEN SWITCH HERE)
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: controller.isTodayData.value
                      ? TodayDataScreen()
                      : CustomDateDataScreen(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }




  // build button.............
  Widget _buildToggleButton(String text, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? AppColors.appPrimaryColor : Color(0xffA5A7B9),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.appPrimaryColor : Color(0xffA5A7B9),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: globalTextStyle(
              fontSize: 14,
              color: isActive ? AppColors.appPrimaryColor : Color(0xffA5A7B9),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

