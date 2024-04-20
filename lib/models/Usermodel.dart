// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  int id;
  User({
    required this.id,
  });
 factory User.fromJson(Map<String, dynamic> json) {
    return User(id:0);
}}
