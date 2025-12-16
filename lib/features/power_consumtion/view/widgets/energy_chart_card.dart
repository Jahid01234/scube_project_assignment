import 'package:flutter/material.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/power_consumtion/model/energy_data.dart';

class EnergyChartCard extends StatelessWidget {
  final String title;
  final String totalValue;
  final List<EnergyData> dataList;

  const EnergyChartCard({
    super.key,
    required this.title,
    required this.totalValue,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffA5A7B9),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: globalTextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  totalValue,
                  style: globalTextStyle(
                    fontSize: 32,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return _buildDataRow(dataList[index], index);
              },
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
          return const Color(0xff7BD7FF);
        case 2:
          return const Color(0xff9747FF);
        case 3:
          return const Color(0xffFF9A00);
        default:
          return AppColors.appPrimaryColor;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffA5A7B9),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                  const SizedBox(height: 6),
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

              const SizedBox(width: 10),

              Container(
                height: 50,
                width: 1,
                color: const Color(0xffA5A7B9),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow('Data', data.todayValue),
                    SizedBox(height: getHeight(4)),
                    _infoRow('Cost', data.customValue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            title,
            style: globalTextStyle(
              fontSize: 12,
              color: const Color(0xff646984),
            ),
          ),
        ),
        Text(
          ':  ',
          style: globalTextStyle(
            fontSize: 12,
            color: const Color(0xff646984),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: globalTextStyle(
              fontSize: 12,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
