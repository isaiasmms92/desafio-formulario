import 'package:api_rest3/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class FormRepository {
  Future<Either<Failure, List<dynamic>>> getAll();
  Future<Either<Failure, List<dynamic>>> getEligibilityStatus(String query);
}
