import 'package:get/get.dart';
import 'package:scube_assignment/features/power_consumtion/model/energy_data.dart';
import 'package:scube_assignment/features/power_consumtion/model/revenue_data.dart';

class PowerConsumptionController extends GetxController {
  // Observable variables
  var isDataView = true.obs;
  var isTodayData = true.obs;




  var fromDate = Rx<DateTime?>(null);
  var toDate = Rx<DateTime?>(null);
  var showDatePicker = false.obs;

  // Sample data
  var energyDataList = <EnergyData>[].obs;
  var revenueDataList = <RevenueData>[].obs;
  var revenueExpanded = true.obs;

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

  void toggleDatePicker() {
    showDatePicker.value = !showDatePicker.value;
  }

}