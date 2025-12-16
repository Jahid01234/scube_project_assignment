import 'package:get/get.dart';

class RevenueData {
  final String data;
  final String value;
  var isExpanded = true.obs;

  RevenueData({required this.data, required this.value});
}

final List<RevenueData> revenueData = [
  RevenueData(data: '2798.50 (25.63%)', value: '35689 ৳'),
  RevenueData(data: '2798.50 (25.63%)', value: '258695 ৳'),
  RevenueData(data: '2798.50 (25.63%)', value: '258695 ৳'),
  RevenueData(data: '2798.50 (25.63%)', value: '35689 ৳'),
];