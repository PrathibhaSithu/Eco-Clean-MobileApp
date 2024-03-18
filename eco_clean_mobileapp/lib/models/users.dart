class Users {
  late String displayName;
  String email;
  String password;
  late String phone;
  late String role;
  late String uuid;

  Users();

  Users.fromMap(Map<String, dynamic> data) {
    displayName = data['displayName'];
    email = data['email'];
    password = data['password'];
    phone = data['phone'];
    role = data['role'];
    uuid = data['uuid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
      'phone': phone,
      'role': role,
      'uuid': uuid,
    };
  }
}