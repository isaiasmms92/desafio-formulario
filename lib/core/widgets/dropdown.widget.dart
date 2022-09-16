import 'package:api_rest3/modules/features/form/presenter/pages/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropdwonNewWidget extends StatelessWidget {
  const DropdwonNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FormController>();

    final List<String> _dropdownValuesage = [
      'pending',
      'eligible',
      'notEligible',
      'todos',
    ];
    return SizedBox(
      width: 130,
      height: 38,
      child: DropdownButtonFormField(
        isDense: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: ThemeData().primaryColor,
        ),
        iconEnabledColor: Colors.white,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        dropdownColor: ThemeData().primaryColor,
        value: _dropdownValuesage[3],
        onChanged: (newvalue) {
          controller.getEligibilityStatus(newvalue.toString());
        },
        items: _dropdownValuesage.map((value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }
}
