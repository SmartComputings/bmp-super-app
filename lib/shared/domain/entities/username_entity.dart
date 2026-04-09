import 'package:equatable/equatable.dart';

class UsernameEntity extends Equatable {
  final String username;
  final String? matrixId;
  final DateTime lastUpdated;

  const UsernameEntity({
    required this.username,
    this.matrixId,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [username, matrixId, lastUpdated];
}
