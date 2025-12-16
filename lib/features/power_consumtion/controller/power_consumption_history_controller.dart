import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scube_assignment/features/power_consumtion/model/energy_data.dart';
import 'package:scube_assignment/features/power_consumtion/model/revenue_data.dart';

class PowerConsumptionController extends GetxController {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  RxList<EnergyData> energyDataList = <EnergyData>[].obs;
  RxList<RevenueData> revenueDataList = <RevenueData>[].obs;
  RxBool isDataView = true.obs;
  RxBool isTodayData = true.obs;
  RxBool revenueExpanded = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadEnergyData();
    loadRevenueData();
  }

  void loadEnergyData() {
    energyDataList.value = energyData;
  }

  void loadRevenueData() {
    revenueDataList.value = revenueData;
  }

  void toggleRevenueExpanded() {
    revenueExpanded.value = !revenueExpanded.value;
  }

  void toggleView() {
    isDataView.value = !isDataView.value;
  }

  void toggleTodayDataView() {
    isTodayData.value = !isTodayData.value;
  }


  Future<void> pickFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      fromDateController.text =
          DateFormat('dd MMM yyyy').format(picked);
    }
  }

  Future<void> pickToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      toDateController.text =
          DateFormat('dd MMM yyyy').format(picked);
    }
  }

  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }
}
