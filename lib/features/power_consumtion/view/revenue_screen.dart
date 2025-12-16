import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/icons_path.dart';
import 'package:scube_assignment/core/global_widgets/custom_circular_progress.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/power_consumtion/controller/power_consumption_history_controller.dart';
import 'package:scube_assignment/features/power_consumtion/model/revenue_data.dart';

class RevenueScreen extends StatelessWidget {
  RevenueScreen({super.key});
  final PowerConsumptionController controller = Get.put(PowerConsumptionController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCircularProgress(spentAmount: 8897455, totalBudget: 10000000,title: "tk",showOnlyAmount: true),
          const SizedBox(height: 16),
          Obx(
                () => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.containerBorderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  /// HEADER
                  GestureDetector(
                    onTap: () => controller.toggleRevenueExpanded(),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                IconsPath.solarChart,
                                height: 18,
                                width: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Data & Cost Info',
                                style: globalTextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: AppColors.appPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              controller.revenueExpanded.value
                                  ? Icons.keyboard_double_arrow_up
                                  : Icons.keyboard_double_arrow_down,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// DIVIDER (only when expanded)
                  if (controller.revenueExpanded.value)
                    Divider(
                      height: 1,
                      color: AppColors.containerBorderColor,
                    ),

                  /// BODY
                  if (controller.revenueExpanded.value)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.revenueDataList.length,
                        itemBuilder: (context, index) {
                          final data =
                          controller.revenueDataList[index];
                          return _buildRevenueRow(index + 1, data);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildRevenueRow(int index, RevenueData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Data  $index   :',
                style: globalTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff646984)
                ),
              ),
              const SizedBox(width: 12),
              Text(
                data.data,
                style: globalTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.black
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Cost  $index   :',
                style: globalTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff646984)
                ),
              ),
              const SizedBox(width: 12),
              Text(
                data.value,
                style: globalTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.black
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



