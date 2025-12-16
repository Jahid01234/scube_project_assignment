import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/global_widgets/custom_app_bar_widget.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/power_consumtion/controller/power_consumption_history_controller.dart';
import 'package:scube_assignment/features/power_consumtion/view/data_view_screen.dart';
import 'package:scube_assignment/features/power_consumtion/view/revenue_screen.dart';

class PowerConsumptionHistoryScreen extends StatelessWidget {
  PowerConsumptionHistoryScreen({super.key});

  final PowerConsumptionController controller =
  Get.put(PowerConsumptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.containerBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => _buildToggleButton(
                          'Data View',
                          controller.isDataView.value,
                              () => controller.toggleView(),
                         ),
                        ),
                        const SizedBox(width: 12),
                        Obx(() => _buildToggleButton(
                          'Revenue View',
                          !controller.isDataView.value,
                              () => controller.toggleView(),
                         ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return Container(
                width: double.infinity,
                color: Colors.white,
                child: controller.isDataView.value
                    ? DataViewScreen()
                    : RevenueScreen(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive
                      ? AppColors.appPrimaryColor
                      : Color(0xffA5A7B9),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? AppColors.appPrimaryColor
                        : Color(0xffA5A7B9),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: globalTextStyle(
                fontSize: 16,
                color: isActive
                    ? AppColors.appPrimaryColor
                    : Color(0xffA5A7B9),
                fontWeight: isActive
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
