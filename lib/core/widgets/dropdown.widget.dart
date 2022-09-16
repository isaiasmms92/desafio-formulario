import 'package:api_rest3/modules/features/form/presenter/pages/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropdwonNewWidget extends StatelessWidget {
  const DropdwonNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FormController>();

    final List<String> _dropdownValuesage = [
      'Pendente',
      'Elegível',
      'Não Elegível',
      'Todos',
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
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
        style: const TextStyle(color: Colors.white),
        dropdownColor: ThemeData().primaryColor,
        value: _dropdownValuesage[3],
        onChanged: (newvalue) {
          controller.dropdownValuesage(newvalue.toString());
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
