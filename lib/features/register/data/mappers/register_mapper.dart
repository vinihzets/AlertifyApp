class RegisterMapper {
  String email;
  bool active;
  String name;

  RegisterMapper(this.email, this.active, this.name);

  toMap() {
    return {
      'email': email,
      'active': active,
      'name': name,
    };
  }
}
