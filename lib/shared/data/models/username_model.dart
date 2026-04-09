import 'package:hive/hive.dart';
import '../../domain/entities/username_entity.dart';

part 'username_model.g.dart';

@HiveType(typeId: 0)
class UsernameModel extends UsernameEntity {
  @HiveField(0)
  final String usernameField;

  @HiveField(1)
  final String? matrixIdField;

  @HiveField(2)
  final DateTime lastUpdatedField;

  const UsernameModel({
    required this.usernameField,
    this.matrixIdField,
    required this.lastUpdatedField,
  }) : super(
          username: usernameField,
          matrixId: matrixIdField,
          lastUpdated: lastUpdatedField,
        );

  factory UsernameModel.fromEntity(UsernameEntity entity) {
    return UsernameModel(
      usernameField: entity.username,
      matrixIdField: entity.matrixId,
      lastUpdatedField: entity.lastUpdated,
    );
  }

  UsernameEntity toEntity() {
    return UsernameEntity(
      username: usernameField,
      matrixId: matrixIdField,
      lastUpdated: lastUpdatedField,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': usernameField,
      'matrixId': matrixIdField,
      'lastUpdated': lastUpdatedField.toIso8601String(),
    };
  }

  factory UsernameModel.fromJson(Map<String, dynamic> json) {
    return UsernameModel(
      usernameField: json['username'] as String,
      matrixIdField: json['matrixId'] as String?,
      lastUpdatedField: DateTime.parse(json['lastUpdated'] as String),
    );
  }
}
