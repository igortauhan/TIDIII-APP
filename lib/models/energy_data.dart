class EnergyData {
  final String id;
  final int value;
  final DateTime registrationDate;

  EnergyData({
    required this.id,
    required this.value,
    required this.registrationDate
  });

  factory EnergyData.fromJson(Map<String, dynamic> json) {
    return EnergyData(
        id: json['id'],
        value: json['value'],
        registrationDate: json['registration_date']
    );
  }
}
