class RegisterMapper {
  String email;
  bool active;

  RegisterMapper(this.email, this.active);

  toMap() {
    return {
      'email': email,
      'active': active,
    };
  }
}
