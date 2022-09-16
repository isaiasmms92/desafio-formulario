import 'package:api_rest3/core/widgets/card.widget.dart';
import 'package:api_rest3/core/widgets/dropdown.widget.dart';
import 'package:api_rest3/modules/features/form/presenter/pages/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final controller = Modular.get<FormController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    controller.fetchAllForms();
    controller.getAll();
  }

  @override
  Widget build(BuildContext context) {
    var listStatus = controller.listElegibility;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulários'),
          centerTitle: true,
          actions: const [],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.postAll();
                      controller.getAll();
                    },
                    child: const Text(
                      'Atualizar Formularios',
                    )),
                const DropdwonNewWidget(),
              ],
            ),
            listStatus.isEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Center(
                        heightFactor: 15,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: listStatus.length,
                      itemBuilder: (context, index) {
                        return CardNewWidget(
                          age: '${controller.age(index).toString()} anos',
                          birthDate: DateFormat('dd/MM/yyyy')
                              .format(listStatus[index]['birthday'].toDate()),
                          name:
                              controller.getInitials(listStatus[index]['name']),
                          sex: listStatus[index]['sex'] == 1
                              ? 'Feminino'
                              : 'Masculino',
                          status: listStatus[index]['eligibilityStatus'],
                        );
                      },
                    ),
                  ),
          ],
        ));
  }
}

// margin: const EdgeInsets.all(10),
//                           child: ListTile(
//                             leading: Column(
//                               children: [
//                                 Text(
                                  // controller
                                  //     .getInitials(listStatus[index]['name']),
                                  // style: const TextStyle(fontSize: 20),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
                                  // listStatus[index]['sex'] == 1
                                  //     ? 'Feminino'
                                  //     : 'Masculino',
//                                   style: const TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             title: Text(
                              // '${controller.age(index).toString()} anos',
//                               style: const TextStyle(fontSize: 15),
//                             ),
//                             subtitle: Text(
                              // DateFormat('dd/MM/yyyy').format(
                              //     listStatus[index]['birthday'].toDate()),
//                               style: const TextStyle(fontSize: 15),
//                             ),
//                             trailing: Text(
//                               listStatus[index]['eligibilityStatus'],
//                               style: const TextStyle(fontSize: 15),
//                             ),
//                           ),
                        