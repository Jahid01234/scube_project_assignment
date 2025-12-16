import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/global_widgets/custom_app_bar_widget.dart';
import 'package:scube_assignment/core/routes/routes.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/dashboard/view/widgets/circle_power_card.dart';
import 'package:scube_assignment/features/dashboard/view/widgets/dashboard_menu_item.dart';
import 'package:scube_assignment/features/dashboard/view/widgets/data_tile_card.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // 🔹 Electricity Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.containerBorderColor,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  _summaryTabBar(),
                  SizedBox(height: getHeight(16)),
                  Text(
                    "Electricity",
                    style: globalTextStyle(
                      fontSize: 16,
                      color: Color(0xff979797),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(color: AppColors.gray),
                  ),
                  SizedBox(height: getHeight(20)),
                  CirclePowerCard(),
                  SizedBox(height: getHeight(16)),
                  _sourceTabBarButton(),
                  SizedBox(height: getHeight(6)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(thickness: 3, color: Color(0xffA5A7B9)),
                  ),
                  SizedBox(
                    height: getHeight(300),
                    child: Obx(() => ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.dataTypeList.length,
                        itemBuilder: (context, index) {
                          final model = controller.dataTypeList[index];
                          return DataTileCard(
                            model: model,
                            label1: model.label1,
                            label2: model.label2,
                            isLast: index == controller.dataTypeList.length - 1,
                            onTap: () {
                              Get.toNamed(AppRoutes.powerConsumptionHistory);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                ],
              ),
            ),
            SizedBox(height: getHeight(40)),
            DashboardMenuGrid(

            ),
          ],
        ),
      ),
    );
  }

  Widget _sourceTabBarButton() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff6C99B8).withValues(alpha: 0.20),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: ["Source", "Load"]
                .asMap()
                .entries
                .map(
                  (e) => Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeSource(e.key),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: getHeight(14)),
                        decoration: BoxDecoration(
                          color: controller.selectedSourceIndex.value == e.key
                              ? AppColors.appPrimaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          e.value,
                          style: globalTextStyle(
                            color: controller.selectedSourceIndex.value == e.key
                                ? AppColors.white
                                : AppColors.gray,
                            fontWeight:
                                controller.selectedSourceIndex.value == e.key
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _summaryTabBar() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: ["Summary", "SLD", "Data"]
                  .asMap()
                  .entries
                  .map(
                    (e) => Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(e.key),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: getHeight(14),
                          ),
                          decoration: BoxDecoration(
                            color: controller.selectedTabIndex.value == e.key
                                ? AppColors.appPrimaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            e.value,
                            style: globalTextStyle(
                              color: controller.selectedTabIndex.value == e.key
                                  ? AppColors.white
                                  : AppColors.gray,
                              fontWeight:
                                  controller.selectedTabIndex.value == e.key
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
            ),
            Container(height: 1, width: double.infinity, color: AppColors.gray),
          ],
        ),
      ),
    );
  }
}
