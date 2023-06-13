class UserEntity {
  bool active;
  bool isAdmin;
  String name;
  String docId;
  String email;
  String fcmToken;
  String userId;

  UserEntity(this.active, this.isAdmin, this.name, this.docId, this.email,
      this.fcmToken, this.userId);
}
