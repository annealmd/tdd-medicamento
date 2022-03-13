import 'package:equatable/equatable.dart';

class Medicamento extends Equatable {
  final int id;
  final String title;
  final String quantidade;
  final String dose;
  final int frequencia;
  final int? duracao;
  final DateTime dataInicio;
  final DateTime horaInicio;
  final bool isContinuo;

  const Medicamento({
    required this.id,
    required this.title,
    required this.quantidade,
    required this.dose,
    required this.frequencia,
    this.duracao,
    required this.dataInicio,
    required this.horaInicio,
    required this.isContinuo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        quantidade,
        dose,
        frequencia,
        duracao,
        dataInicio,
        horaInicio,
        isContinuo
      ];
}
