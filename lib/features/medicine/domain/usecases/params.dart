abstract class IParams {}

class AddParams extends IParams {
  final int? id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int? duration;
  final DateTime start;
  final bool isContinuous;

  AddParams(
      {this.id,
      required this.title,
      required this.quantity,
      required this.dose,
      required this.frequency,
      this.duration,
      required this.start,
      required this.isContinuous});
}
