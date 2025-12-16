import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/power_consumtion/controller/power_consumption_history_controller.dart';
import 'package:scube_assignment/features/power_consumtion/model/energy_data.dart';

class TodayDataScreen extends StatelessWidget {
  TodayDataScreen({super.key});
  final PowerConsumptionController controller = Get.put(
    PowerConsumptionController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffA5A7B9), width: 1),
        ),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Energy Chart',
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: 30),
                  Text(
                    '5.53 kw',
                    style: globalTextStyle(
                      fontSize: 32,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.energyDataList.length,
                itemBuilder: (context, index) {
                  final data = controller.energyDataList[index];
                  return _buildDataRow(data, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(EnergyData data, int index) {
    Color getColorByIndex(int index) {
      switch (index) {
        case 0:
          return AppColors.appPrimaryColor;
        case 1:
          return Color(0xff7BD7FF);
        case 2:
          return Color(0xff9747FF);
        case 3:
          return Color(0xffFF9A00);
        default:
          return AppColors.appPrimaryColor;
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffA5A7B9), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: getColorByIndex(index),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    data.label,
                    style: globalTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10), // Space before divider
              // Vertical Divider using Container
              Container(
                height: 50, // Adjust height as needed
                width: 1,
                color: Color(0xffA5A7B9),
              ),

              SizedBox(width: 10),
              // Right side - Data and Cost
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Data row
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            'Data',
                            style: globalTextStyle(
                              fontSize: 12,
                              color: Color(0xff646984),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          ':  ',
                          style: globalTextStyle(
                            fontSize: 12,
                            color: Color(0xff646984),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.todayValue,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(4)),
                    // Cost row
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            'Cost',
                            style: globalTextStyle(
                              fontSize: 12,
                              color: Color(0xff646984),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          ':  ',
                          style: globalTextStyle(
                            fontSize: 12,
                            color: Color(0xff646984),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.customValue,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
