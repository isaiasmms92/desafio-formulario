abstract class FormDataSource {
  Future<List<dynamic>> getAll();
  Future<List<dynamic>> getEligibilityStatus(String query);
}
