import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

part 'profile_table.g.dart';

@HiveType(typeId: 0)
class ProfileModel {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String userFullName;

  @HiveField(2)
  final String avatar;

  @HiveField(3)
  final String role;

  ProfileModel(
      {required this.token,
      required this.userFullName,
      required this.avatar,
      required this.role});
}
