class Prescription {
  String name;
  String duration;
  String type;
  String desc;

  Prescription(
      {required this.name,
      required this.duration,
      required this.type,
      required this.desc});

  Prescription copy({
    required String name,
    required String duration,
    required String type,
    required String desc,
  }) =>
      Prescription(name: name, duration: duration, desc: desc, type: type);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Prescription &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          duration == other.duration &&
          desc == other.desc;

  @override
  int get hashCode =>
      name.hashCode ^
      name.hashCode ^
      duration.hashCode ^
      desc.hashCode ^
      type.hashCode;
}
