import 'package:fpdart/fpdart.dart';
import '../repositories/username_repository.dart';

class StoreUsernameUseCase {
  final UsernameRepository repository;

  StoreUsernameUseCase(this.repository);

  Future<Either<String, Unit>> call(String username, {String? matrixId}) async {
    return await repository.storeUsername(username, matrixId: matrixId);
  }

  Future<Either<String, Unit>> clear() async {
    return await repository.clearUsername();
  }
}
