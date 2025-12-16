import 'package:scube_assignment/core/const/icons_path.dart';

class DataTypeModel {
  final String title;
  final String image;
  final bool isActive;
  final String data1;
  final String data2;
  final String? label1;
  final String? label2;

  DataTypeModel({
    required this.title,
    required this.image,
    required this.isActive,
    required this.data1,
    required this.data2,
    this.label1,
    this.label2,
  });
}

final List<DataTypeModel> dataTypes = [
  DataTypeModel(
    title: "Data View",
    image: IconsPath.solarCell,
    isActive: false,
    data1: "55505.63",
    data2: "58805.63",
    label1: "Data 1",
    label2: "Data 2",
  ),
  DataTypeModel(
    title: "Data Type 2",
    image: IconsPath.electical,
    isActive: false,
    data1: "55505.63",
    data2: "58805.63",
    label1: "Data 1",
    label2: "Data 2",
  ),
  DataTypeModel(
    title: "Data Type 3",
    image: IconsPath.power,
    isActive: true,
    data1: "55505.63",
    data2: "58805.63",
    label1: "Data 1",
    label2: "Data 2",
  ),
  DataTypeModel(
    title: "Total Solar",
    image: IconsPath.solarCell,
    isActive: false,
    data1: "55505.63 kW",
    data2: "58805.63 kWh",
    label1: "Live Power",
    label2: "Today Energy",
  ),
];