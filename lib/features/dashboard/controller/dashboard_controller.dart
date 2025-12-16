import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_assignment/core/const/icons_path.dart';
import 'package:scube_assignment/features/dashboard/model/data_type_model.dart';


class DashboardController extends GetxController {
  var selectedTabIndex = 0.obs;
  var selectedSourceIndex = 0.obs;
  RxList<DataTypeModel> dataTypeList = <DataTypeModel>[].obs;
  final ScrollController scrollController = ScrollController();
  final RxDouble scrollProgress = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
    loadDataType();
    scrollController.addListener(_updateScrollProgress);
  }

  void loadDataType() {
    dataTypeList.value = dataTypes;
  }


  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void changeSource(int index) {
    selectedSourceIndex.value = index;
  }

  void _updateScrollProgress() {
    if (scrollController.hasClients) {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      scrollProgress.value = maxScroll > 0 ? currentScroll / maxScroll : 0.0;
    }
  }

  final List<Map<String, String>> items = [
    {
      "title": "Analysis Pro",
      "image": IconsPath.chart,
    },
    {
      "title": "G. Generator",
      "image": IconsPath.generator,
    },
    {
      "title": "Plant Summary",
      "image": IconsPath.charge,
    },
    {
      "title": "Natural Gas",
      "image": IconsPath.fire,
    },
    {
      "title": "D. Generator",
      "image": IconsPath.generator,
    },
    {
      "title": "Water Process",
      "image": IconsPath.faucet,
    },
  ];
  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
