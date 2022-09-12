class RegisteredUser {
  String username;
  String password;
  RegisteredUser(this.username, this.password);
  Map toJson() => {
        'name': username,
        'password': password,
      };
}
