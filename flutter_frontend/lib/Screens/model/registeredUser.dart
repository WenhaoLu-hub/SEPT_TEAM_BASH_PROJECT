class RegisteredUser {
  String username;
  String password;
  RegisteredUser(this.username, this.password);
  Map toJson() => {
        'email': username,
        'password': password,
      };
}
