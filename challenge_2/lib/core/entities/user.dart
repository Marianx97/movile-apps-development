class User {
  String email;
  String password;
  String username;
  String? hobby;

  User({
    required this.email,
    required this.password,
    required this.username,
    this.hobby = 'coding',
  });

  void printCredentials() {
    print('Username: $username');
    print('Email: $email');
    print("password: haha don't share your password");
  }
}
