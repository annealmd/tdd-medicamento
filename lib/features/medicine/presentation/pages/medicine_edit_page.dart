// ignore_for_file: must_be_immutable

import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:app_medicamento/features/medicine/presentation/controllers/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/internationalization.dart';
import '../widgets/card_edit_display.dart';
import '../widgets/form/custom_form_field.dart';
import '../widgets/form/date_time_picker.dart';
import '../widgets/form/date_time_widget.dart';

class MedicineEditPage extends StatefulWidget {
  MedicineEditPage({Key? key, required this.medicine, required this.index})
      : super(key: key);
  static const routeName = '/editMedicine';
  MedicineEntity medicine;
  final int index;

  @override
  State<MedicineEditPage> createState() => _MedicineEditPageState();
}

class _MedicineEditPageState extends State<MedicineEditPage> {
  final EditMedicineBloc editBloc = GetIt.I.get<EditMedicineBloc>();
  final DeleteMedicineBloc deletetBloc = GetIt.I.get<DeleteMedicineBloc>();
  final timeFormat = Internationalization.timeFormat;
  final _formKey = GlobalKey<FormState>();

  final quantityFocusNode = FocusNode();
  final frequencyFocusNode = FocusNode();
  final durationFocusNode = FocusNode();
  final hourFocusNode = FocusNode();
  final saveFocusNode = FocusNode();

  @override
  void dispose() {
    quantityFocusNode.dispose();
    frequencyFocusNode.dispose();
    durationFocusNode.dispose();
    hourFocusNode.dispose();
    saveFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var quantity = widget.medicine.quantity;
    var frequency = widget.medicine.frequency;
    var duration = widget.medicine.duration;
    var start = widget.medicine.start;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Retorna',
          padding: const EdgeInsets.all(5),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
        ),
        backgroundColor: AppTheme.avatarColor(widget.index + 1),
        title: Text(
          widget.medicine.title,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        widthFactor: double.infinity,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.avatarColor(widget.index + 1),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '${widget.index + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    subtitle: CardEditDisplay(
                      start: widget.medicine.start,
                      duration: widget.medicine.duration,
                      isContinuous: widget.medicine.isContinuous,
                    ),
                  ),
                ),
                const Divider(),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomFormField(
                          keyboard: TextInputType.number,
                          autoFocus: quantityFocusNode,
                          focus: frequencyFocusNode,
                          label: 'Quantidade de ${widget.medicine.dose} :',
                          hint: widget.medicine.quantity,
                          // validator: (value) =>
                          //     value!.isEmpty ? 'Campo Obrigatório' : null,
                          onSaved: (value) {
                            if (value != null) {
                              quantity = value;
                            }
                          },
                        ),
                        const Divider(),
                        CustomFormField(
                          keyboard: TextInputType.number,
                          autoFocus: frequencyFocusNode,
                          focus: durationFocusNode,
                          label: 'Frequência ao dia',
                          hint: '${widget.medicine.frequency}',
                          // validator: (value) =>
                          //     value!.isEmpty ? 'Campo Obrigatório' : null,
                          onSaved: (value) {
                            if (value != null) {
                              frequency = int.parse(value);
                            }
                          },
                        ),
                        const Divider(),
                        widget.medicine.isContinuous
                            ? const Text(
                                'Medicamento de Uso Contínuo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : CustomFormField(
                                keyboard: TextInputType.number,
                                autoFocus: durationFocusNode,
                                focus: hourFocusNode,
                                label: 'Duração',
                                hint: '${widget.medicine.duration}',
                                // validator: (value) =>
                                //     value!.isEmpty ? 'Campo Obrigatório' : null,
                                onSaved: (value) {
                                  if (value != null) {
                                    duration = int.parse(value);
                                  }
                                }),
                        const Divider(),
                        DateTimeWidget(
                          dateAndtime: false,
                          start: start,
                          dateTimeStyle: AppTheme.dateTimeStyle(context),
                          onPressedTime: () async {
                            final pickTime =
                                await DateTimePicker.selectTime(context, start);
                            if (pickTime == null) return;
                            setState(() => start = pickTime);
                          },
                          hourFocusNode: hourFocusNode,
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            _formKey.currentState!.save();

                            editBloc.add(
                              EditMedicine(
                                id: widget.medicine.id,
                                title: widget.medicine.title,
                                quantity: quantity,
                                dose: widget.medicine.dose,
                                frequency: frequency,
                                duration: duration!,
                                start: start,
                                isContinuous: widget.medicine.isContinuous,
                              ),
                            );
                            Navigator.popAndPushNamed(context, '/');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 161, 21, 11),
        child: const Icon(Icons.delete),
        onPressed: () => _showDialog(context),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 8,
            //shape: const CircleBorder(),
            title: Text('Apagar ${widget.medicine.title}?'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[800])),
                onPressed: () {
                  deletetBloc.add(DeleteMedicine(id: widget.medicine.id));
                  Navigator.popAndPushNamed(context, '/');
                },
                child: const Text('Sim'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                child: const Text('Não'),
              )
            ],
          );
        });
  }
}
