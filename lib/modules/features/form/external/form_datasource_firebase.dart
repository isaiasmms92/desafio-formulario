import 'package:api_rest3/modules/features/form/infra/datasources/form_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormDataSourceFirebase implements FormDataSource {
  FirebaseFirestore firestore;

  FormDataSourceFirebase(this.firestore);

  @override
  Future<List<dynamic>> getAll() async {
    const path = 'users';

    final collection = firestore.collection(path);
    final collectionReference = await collection.get();
    final documents = collectionReference.docs.map((e) => e.data()).toList();

    return documents;
  }

  @override
  Future<List<dynamic>> getEligibilityStatus(String query) async {
    const path = 'users';

    final collection = firestore.collection(path);
    final collectionReference =
        await collection.where('eligibilityStatus', isEqualTo: query).get();
    final documents = collectionReference.docs.map((e) => e.data()).toList();

    return documents;
  }
}
