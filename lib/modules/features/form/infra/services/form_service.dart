import 'package:api_rest3/modules/features/form/domain/models/form_model.dart';
import 'package:api_rest3/modules/features/form/infra/services/http_client_interface.dart';

const url = 'https://pastebin.com/raw/zPUtKAdx';

class FormService {
  final IHttpClient client;

  FormService(this.client);

  Future<List<FormModel>> getTodos() async {
    final body = await client.get(url);
    return body.map<FormModel>((e) => FormModel.fromJson(e)).toList();
  }
}
