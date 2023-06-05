import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';

class CustomNotificationMapper extends CustomNotificationEntity {
  CustomNotificationMapper(super.title, super.message, super.senderId);

  factory CustomNotificationMapper.fromJson(Map map) {
    return CustomNotificationMapper(map['title'], map['body'], map['senderId']);
  }
}
