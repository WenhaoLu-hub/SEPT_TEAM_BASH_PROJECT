class User {
  String username;
  String password;
  String accountType;
  User(this.username, this.password,this.accountType);
  Map toJson() => {
        'name': username,
        'password': password,
        'accountType' : accountType,
      };
}