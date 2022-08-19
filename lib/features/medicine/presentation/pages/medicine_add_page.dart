import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/internationalization.dart';
import '../controllers/bloc/add_medicine_bloc.dart';
import '../widgets/form/form.dart';

class MedicineAddPage extends StatefulWidget {
  const MedicineAddPage({Key? key}) : super(key: key);
  static const routeName = '/addMedicine';

  @override
  State<MedicineAddPage> createState() => _MedicineAddPageState();
}

class _MedicineAddPageState extends State<MedicineAddPage> {
  final AddMedicineBloc addBloc = GetIt.I.get<AddMedicineBloc>();
  final dateFormat = Internationalization.dateFormat;
  final _formKey = GlobalKey<FormState>();
  String title = 'title';
  late String quantity;
  late String dose = 'ml';
  late int frequency;
  int duration = 2000;
  DateTime start =
      DateTime(DateTime.now().year, DateTime.now().month, 10, 22, 30);
  var isContinuous = false;

  final titleFocusNode = FocusNode();
  final quantityFocusNode = FocusNode();
  final doseFocusNode = FocusNode();
  final frequencyFocusNode = FocusNode();
  final durationFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final hourFocusNode = FocusNode();
  final isContinuousFocusNode = FocusNode();
  final saveFocusNode = FocusNode();

  @override
  void dispose() {
    titleFocusNode.dispose();
    quantityFocusNode.dispose();
    doseFocusNode.dispose();
    frequencyFocusNode.dispose();
    durationFocusNode.dispose();
    dateFocusNode.dispose();
    hourFocusNode.dispose();
    isContinuousFocusNode.dispose();
    saveFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Retorna',
          padding: const EdgeInsets.all(5),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
        ),
        toolbarHeight: 30,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.4, 0.6, 0.9],
            colors: [
              Colors.green[50]!,
              Colors.yellow[50]!,
              Colors.green[50]!,
              Colors.yellow[50]!,
            ],
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: BlocBuilder<AddMedicineBloc, AddMedicineState>(
            bloc: addBloc,
            builder: (context, state) {
              if (state is AddMedicineError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                );
              } else if (state is AddMedicineSuccess) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 52, 3),
                    ),
                  ),
                );
              } else {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CustomFormField(
                          keyboard: TextInputType.name,
                          autoFocus: titleFocusNode,
                          focus: quantityFocusNode,
                          label: 'Medicamento',
                          hint: 'Entre o nome do medicamento.',
                          icon: Icons.medication,
                          validator: (value) =>
                              value!.isEmpty ? 'Nome Obrigatório' : null,
                          onSaved: (value) => title = value as String,
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomFormField(
                                keyboard: TextInputType.number,
                                autoFocus: quantityFocusNode,
                                focus: doseFocusNode,
                                label: 'Quantidade',
                                hint: '5(ml)',
                                icon: Icons.pin_drop_outlined,
                                validator: (value) => value!.isEmpty
                                    ? 'Quantidade Obrigatória'
                                    : null,
                                onSaved: (value) => quantity = value as String,
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 9,
                              child: DoseDropdown(
                                doseFocusNode: doseFocusNode,
                                dose: dose,
                                onChange: (value) {
                                  setState(() {
                                    dose = value as String;
                                  });
                                  FocusScope.of(context)
                                      .requestFocus(frequencyFocusNode);
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomFormField(
                                keyboard: TextInputType.number,
                                autoFocus: frequencyFocusNode,
                                focus: durationFocusNode,
                                label: 'Frequência',
                                hint: '3 (vezes ao dia)',
                                validator: (value) =>
                                    value!.isEmpty ? 'Campo Obrigatório' : null,
                                onSaved: (value) {
                                  frequency = int.parse(value!);
                                },
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 9,
                              child: CheckboxWidget(
                                isContinuousFocusNode: isContinuousFocusNode,
                                isContinuous: isContinuous,
                                onChanged: (value) {
                                  setState(() {
                                    isContinuous = !isContinuous;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        isContinuous
                            ? const Text(
                                '* Tratamento\n permanente *',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              )
                            : CustomFormField(
                                keyboard: TextInputType.number,
                                autoFocus: durationFocusNode,
                                focus: dateFocusNode,
                                label: 'Duração do tratamento',
                                hint: '10 (dias)',
                                validator: (value) =>
                                    value!.isEmpty ? 'Campo Obrigatório' : null,
                                onSaved: (value) =>
                                    duration = int.parse(value!),
                              ),
                        const Divider(),
                        const Text(
                          'Início do tratamento',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DateTimeWidget(
                          dateAndtime: true,
                          start: start,
                          dateTimeStyle: AppTheme.dateTimeStyle(context),
                          onPressedDate: () async {
                            final pickDate =
                                await DateTimePicker.selectDate(context, start);
                            if (pickDate == null) return;
                            setState(() => start = pickDate);
                          },
                          onPressedTime: () async {
                            final pickTime =
                                await DateTimePicker.selectTime(context, start);
                            if (pickTime == null) return;
                            setState(() => start = pickTime);
                          },
                          dateFocusNode: dateFocusNode,
                          hourFocusNode: hourFocusNode,
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          focusNode: saveFocusNode,
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              addBloc.add(
                                AddMedicine(
                                  title: title,
                                  quantity: quantity,
                                  dose: dose,
                                  frequency: frequency,
                                  duration: duration,
                                  start: start,
                                  isContinuous: isContinuous,
                                ),
                              );
                              Navigator.popAndPushNamed(context, '/');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg:
        'Atenção - o horário da PRIMEIRA DOSE e a frequência definem o ALARME. ',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5,
    //backgroundColor: Colors.black87,
    //textColor: Colors.white,
    fontSize: 16.0,
    webShowClose: true,
  );
}

// ignore: must_be_immutable


