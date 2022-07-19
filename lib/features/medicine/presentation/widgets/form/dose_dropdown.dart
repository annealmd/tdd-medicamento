import 'package:flutter/material.dart';

class DoseDropdown extends StatelessWidget {
  final FocusNode doseFocusNode;
  final String dose;
  final void Function(String? value)? onChange;

  DoseDropdown(
      {Key? key,
      required this.doseFocusNode,
      required this.dose,
      this.onChange})
      : super(key: key);
  final doseList = <String>[
    'cápsulas',
    'gotas',
    'ml',
    'gramas',
    'colher',
    'unidade'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      focusNode: doseFocusNode,
      decoration: InputDecoration(
        labelText: 'Escolha a Dose:',
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        hintText: 'Selecione',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Colors.green[700], size: 40),
      value: dose,
      items: doseList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChange,
    );
  }
}
