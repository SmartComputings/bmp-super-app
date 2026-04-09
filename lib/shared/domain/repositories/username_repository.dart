import 'package:fpdart/fpdart.dart';
import '../entities/username_entity.dart';

abstract class UsernameRepository {
  Future<Either<String, UsernameEntity>> getUsername();
  Future<Either<String, UsernameEntity>> getUsernameFromMatrix();
  Future<Either<String, Unit>> storeUsername(String username, {String? matrixId});
  Future<Either<String, Unit>> clearUsername();
  Future<Either<String, Option<String>>> getStoredUsername();
}
