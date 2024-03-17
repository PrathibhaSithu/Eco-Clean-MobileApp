class Users {
  String displayName;
  String email;
  String password;
  String phone;
  String role;
  String uuid;

  Users()
      : displayName = '',
        email = '',
        password = '',
        phone = '',
        role = '',
        uuid = '';

  Users.fromMap(Map<String, dynamic> data)
      : displayName = data['displayName'],
        email = data['email'],
        password = data['password'],
        phone = data['phone'],
        role = data['role'],
        uuid = data['uuid'];

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


// class Users {
//   String displayName;
//   String email;
//   String password;
//   String phone;
//   String role;
//   String uuid;

//   Users(); // default constructor

//   Users.fromMap(Map<String, dynamic> data) {
//     displayName = data['displayName'];
//     email = data['email'];
//     password = data['password'];
//     phone = data['phone'];
//     role = data['role'];
//     uuid = data['uuid'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'displayName': displayName,
//       'email': email,
//       'password': password,
//       'phone': phone,
//       'role': role,
//       'uuid': uuid,
//     };
//   }
// }