import 'package:alertifyapp/core/global/entities/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper(
    super.active,
    super.isAdmin,
    super.name,
    super.docId,
    super.email,
    super.fcmToken,
    super.userId,
  );

  factory UserMapper.fromJson(dynamic map) {
    return UserMapper(
      map['active'],
      map['isAdmin'],
      map['name'],
      map['docId'],
      map['email'],
      map['fcmToken'],
      map['userId'],
    );
  }
}
