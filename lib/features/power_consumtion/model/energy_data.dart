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
    todayValue: '2798.50 (25.63%)',
    customValue: '57088 tk',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data B',
    todayValue: '76299.95 (25.2013)',
    customValue: '5720959 tk',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data C',
    todayValue: '5698.90 (1.41%)',
    customValue: '56987 tk',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
  EnergyData(
    label: 'Data D',
    todayValue: '6508.25 (26.087%)',
    customValue: '28000 tk',
    todayUnit: 'Data',
    customUnit: 'Cost',
  ),
];
