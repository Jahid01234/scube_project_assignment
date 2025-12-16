import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/icons_path.dart';
import 'package:scube_assignment/core/global_widgets/custom_text_field.dart';
import 'package:scube_assignment/features/power_consumtion/controller/power_consumption_history_controller.dart';
import 'package:scube_assignment/features/power_consumtion/view/widgets/energy_chart_card.dart';

class CustomDateDataScreen extends StatelessWidget {
  CustomDateDataScreen({super.key});

  final PowerConsumptionController controller = Get.put(
    PowerConsumptionController(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  height: 40,
                  radius: 6,
                  controller: controller.fromDateController,
                  readOnly: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  onTap: () => controller.pickFromDate(context),
                  hinText: "From Date",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      IconsPath.calendar,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: CustomTextField(
                  height: 40,
                  radius: 6,
                  controller: controller.toDateController,
                  readOnly: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  onTap: () {
                    controller.pickToDate(context);
                  },
                  hinText: "To Date",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      IconsPath.calendar,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffE2EBF1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.appPrimaryColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                      IconsPath.search,
                      height: 18,
                      width: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // First Card........
        EnergyChartCard(
          title: 'Energy Chart',
          totalValue: '20.05 kw',
          dataList: controller.energyDataList,
        ),

        const SizedBox(height: 16),

        //Second Same Card.......
        EnergyChartCard(
          title: 'Energy Chart',
          totalValue: '5.53 kw',
          dataList: controller.energyDataList,
        ),
      ],
    );
  }
}
