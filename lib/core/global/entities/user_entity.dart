class UserEntity {
  bool active;
  bool isAdmin;
  String docId;
  String email;
  String fcmToken;
  String userId;

  UserEntity(this.active, this.isAdmin, this.docId, this.email, this.fcmToken,
      this.userId);
}
