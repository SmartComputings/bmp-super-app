import 'package:fpdart/fpdart.dart';
import '../entities/username_entity.dart';
import '../repositories/username_repository.dart';

class GetUsernameUseCase {
  final UsernameRepository repository;

  GetUsernameUseCase(this.repository);

  Future<Either<String, UsernameEntity>> call() async {
    return await repository.getUsername();
  }

  Future<Either<String, UsernameEntity>> fromMatrix() async {
    return await repository.getUsernameFromMatrix();
  }

  Future<Either<String, Option<String>>> getStored() async {
    return await repository.getStoredUsername();
  }
}
