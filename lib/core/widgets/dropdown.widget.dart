import 'package:api_rest3/modules/features/form/presenter/pages/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropdwonNewWidget extends StatelessWidget {
  const DropdwonNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FormController>();
    String? _currentlySelecte;

    final List<String> _dropdownValuesage = [
      'pending',
      'eligible',
      'notEligible',
    ];
    return DropdownButton(
      hint: const Text('data'),
      value: _currentlySelecte,
      onChanged: (newvalue) {
        controller.getEligibilityStatus(newvalue.toString());
        _currentlySelecte = newvalue.toString();
      },
      items: _dropdownValuesage.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
    );
  }
}
