import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/routes/routes.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/dashboard/controller/dashboard_controller.dart';

class DashboardMenuGrid extends StatelessWidget {
  DashboardMenuGrid({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate((controller.items.length / 2).ceil(), (rowIndex) {
        final int firstIndex = rowIndex * 2;
        final int secondIndex = firstIndex + 1;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              // Left item...........
              Expanded(child: _menuItem(controller.items[firstIndex])),

              const SizedBox(width: 12),

              // right item...........
              Expanded(
                child: secondIndex < controller.items.length
                    ? _menuItem(controller.items[secondIndex])
                    : const SizedBox(),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _menuItem(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.menuItemDetails);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: AppColors.containerBorderColor,
              width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(item["image"]!, height: 24, width: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                item["title"]!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: globalTextStyle(
                  fontSize: 14,
                  color: const Color(0xff646984),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
