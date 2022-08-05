import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    Key? key,
    required this.isContinuousFocusNode,
    required this.isContinuous,
    required this.onChanged,
  }) : super(key: key);
  final FocusNode isContinuousFocusNode;
  final bool isContinuous;

  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      //autofocus: true,
      focusNode: isContinuousFocusNode,
      // checkboxShape:
      //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      //
      // activeColor: const Color.fromARGB(255, 37, 107, 39),
      title: const Text(
        '* Uso Contínuo.*',
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 145, 13, 4)),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: isContinuous,
      onChanged: onChanged,
      // (value) {
      //   setState(() {
      //     isContinuous = !isContinuous;
      //   });
      //   isContinuous
      //       ? FocusScope.of(context).requestFocus(startFocusNode)
      //       : FocusScope.of(context).requestFocus(durationFocusNode);
      // },
    );
  }
}
