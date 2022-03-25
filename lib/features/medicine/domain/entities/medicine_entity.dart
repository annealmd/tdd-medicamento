class MedicineEntity {
  final int id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int duration;
  final DateTime start;
  final bool isContinuous;

  const MedicineEntity(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.dose,
      required this.frequency,
      required this.duration,
      required this.start,
      required this.isContinuous});
}
