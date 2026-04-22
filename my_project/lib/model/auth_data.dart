class AuthData {
  final String email;
  final String password;
  final String username;
  final String phone;
  AuthData({required this.email, required this.password, required this.username , required this.phone});
  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone']
    );
  }
}
