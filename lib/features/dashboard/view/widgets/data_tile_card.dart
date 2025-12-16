import 'package:flutter/material.dart';
import 'package:scube_assignment/core/const/app_colors.dart';
import 'package:scube_assignment/core/const/app_size.dart';
import 'package:scube_assignment/core/style/global_text_style.dart';
import 'package:scube_assignment/features/dashboard/model/data_type_model.dart';

class DataTileCard extends StatelessWidget {
  final DataTypeModel model;
  final VoidCallback? onTap;
  final String? label1;
  final String? label2;
  final bool isLast;
  final int? index;

  const DataTileCard({
    super.key,
    required this.model,
    this.onTap,
    this.label1,
    this.label2,
    this.isLast = false,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          margin: EdgeInsets.only(bottom: getHeight(12)),
          padding: EdgeInsets.all(getWidth(14)),
          decoration: BoxDecoration(
            color: isLast? Color(0xffE5F4FE).withValues(alpha: 0.3) :  Color(0xffE5F4FE),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.containerBorderColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                model.image,
                height: 24,
                width: 24,
              ),
              SizedBox(width: getWidth(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: index == 1 ? Color(0xffFB902E):Color(0xff78C6FF),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: getWidth(6)),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                model.title,
                                style: globalTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                model.isActive == false ? "(Active)" : "(Inactive)",
                                style: globalTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color:  model.isActive == false ? AppColors.appPrimaryColor : AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(8)),
                    // Data 1
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${label1 ?? 'Data 1'}       :  ",
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: model.data1,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: getHeight(2)),
                    // Data 2
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${label2 ?? 'Data 2'}       :  ",
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: model.data2,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}