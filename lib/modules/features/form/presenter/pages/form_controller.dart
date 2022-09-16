import 'package:api_rest3/modules/features/form/domain/models/form_model.dart';
import 'package:api_rest3/modules/features/form/domain/repositories/form_repository.dart';
import 'package:api_rest3/modules/features/form/infra/services/form_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FormController extends ChangeNotifier {
  final FormService _service;
  final FormRepository _formRepository;

  FormController(this._service, this._formRepository);

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  var forms = <FormModel>[];

  var listElegibility = [];

  num age(i) {
    var hoje = DateTime.now();
    var nascimento = listElegibility[i]['birthday'].toDate();
    var idade = hoje.year - nascimento.year;
    if (hoje.month < nascimento.month) {
      idade--;
    } else if (hoje.month == nascimento.month) {
      if (hoje.day < nascimento.day) idade--;
    }
    return idade;
  }

  String getInitials(String bankAccountName) => bankAccountName.isNotEmpty
      ? bankAccountName.split(' ').map((l) => l[0]).take(2).join()
      : '';

  void dropdownValuesage(String newvalue) {
    if (newvalue == 'Pendente') {
      getEligibilityStatus('pending');
    } else if (newvalue == 'Elegível') {
      getEligibilityStatus('eligible');
    } else if (newvalue == 'Não Elegível') {
      getEligibilityStatus('notEligible');
    } else {
      getAll();
    }
  }

  String status(String status) {
    if (status == 'pending') {
      return 'Pendente';
    } else if (status == 'eligible') {
      return 'Elegível';
    } else if (status == 'notEligible') {
      return 'Não Elegível';
    }
    return '';
  }

  Future<void> addUser(int i) async {
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('users').doc(forms[i].uid);
    return users.set({
      'uid': forms[i].uid,
      'birthday': forms[i].birthday,
      'name': forms[i].name,
      'sex': forms[i].sex,
      'eligibilityStatus': forms[i].eligibilityStatus,
      'fillStatus': forms[i].fillStatus,
    });
  }

  Future<void> fetchAllForms() async {
    forms = await _service.getTodos();
    notifyListeners();
  }

  void postAll() {
    for (var i = 0; i < forms.length; i++) {
      addUser(i);
    }
    notifyListeners();
  }

  void getEligibilityStatus(String query) async {
    final result = await _formRepository.getEligibilityStatus(query);

    result.fold(
      (l) => null,
      (r) => listElegibility = r,
    );
    notifyListeners();
  }

  Future<void> getAll() async {
    final result = await _formRepository.getAll();

    result.fold(
      (l) => null,
      (r) => listElegibility = r,
    );
    notifyListeners();
  }
}
