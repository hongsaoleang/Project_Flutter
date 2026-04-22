class Data {
  final String email;
  final String password;
  final String username;
  Data({required this.email, required this.password, required this.username});
  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      username: map['username'] ?? '',
    );
  }
}
