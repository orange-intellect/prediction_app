import 'package:hive/hive.dart';
part 'user_box.g.dart';

@HiveType(typeId: 1)
class UserBox {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String password;
  @HiveField(3)
  late final String id;
  @HiveField(4)
  final String token;

  UserBox({
    required this.email,
    required this.name,
    required this.id,
    required this.password,
    required this.token,
  });
}

//flutter pub run build_runner build
