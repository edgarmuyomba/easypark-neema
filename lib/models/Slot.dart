class Slot {
  final String slot_number;
  double? latitude;
  double? longitude;
  final bool occupied;

  Slot(
      {required this.slot_number,
      required this.occupied,
      this.latitude,
      this.longitude});

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
        slot_number: json['slot_number'],
        latitude: json['latitude'] != null ? double.parse(json['latitude']) : null,
        longitude: json['longitude'] != null ? double.parse(json['longitude']) : null,
        occupied: json['occupied']);
  }
}