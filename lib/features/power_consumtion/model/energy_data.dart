class EnergyData {
  final String label;
  final String todayValue;
  final String customValue;
  final String todayUnit;
  final String customUnit;

  EnergyData({
    required this.label,
    required this.todayValue,
    required this.customValue,
    required this.todayUnit,
    required this.customUnit,
  });
}

final List<EnergyData> energyData = [
  EnergyData(
    label: 'Data A',
    todayValue: '2798.50 (29.53%)',
    customValue: '35689 ৳',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data B',
    todayValue: '72598.50 (35.39%)',
    customValue: '5259689 ৳',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data C',
    todayValue: '6598.36 (83.90%)',
    customValue: '5698756 ৳',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data D',
    todayValue: '6598.26 (36.59%)',
    customValue: '356987 ৳',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
];
