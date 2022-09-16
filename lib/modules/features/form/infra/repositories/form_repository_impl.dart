import 'package:api_rest3/core/errors/errors.dart';
import 'package:api_rest3/modules/features/form/domain/repositories/form_repository.dart';
import 'package:api_rest3/modules/features/form/infra/datasources/form_datasource.dart';
import 'package:dartz/dartz.dart';

class FormRepositoryFirebase implements FormRepository {
  final FormDataSource _dataSource;

  FormRepositoryFirebase(this._dataSource);

  @override
  Future<Either<Failure, List<dynamic>>> getAll() async {
    try {
      final result = await _dataSource.getAll();

      return Right(result);
    } catch (e) {
      return Left(ErrorOnGetAll());
    }
  }

  @override
  Future<Either<Failure, List>> getEligibilityStatus(String query) async {
    try {
      final result = await _dataSource.getEligibilityStatus(query);

      return Right(result);
    } catch (e) {
      return Left(ErrorOnGetEligibilityStatus());
    }
  }
}
