import 'package:api_rest3/modules/features/form/external/form_datasource_firebase.dart';
import 'package:api_rest3/modules/features/form/infra/repositories/form_repository_impl.dart';
import 'package:api_rest3/modules/features/form/presenter/pages/form_controller.dart';
import 'package:api_rest3/modules/features/form/presenter/pages/form_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/features/form/infra/services/form_service.dart';
import 'modules/features/form/infra/services/http_client.dart';
import 'modules/features/form/infra/services/http_client_interface.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => FirebaseFirestore.instance),
        Bind.singleton<IHttpClient>((i) => HttpPackageClient()),
        Bind.singleton((i) => FormService(i())),
        Bind.factory((i) => FormRepositoryFirebase(i.get())),
        Bind.factory((i) => FormDataSourceFirebase(i.get())),
        Bind.singleton((i) => FormController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const FormPage()),
      ];
}
