class UserQueryParameters {
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

   Map<String, String> toMap() {
    Map<String, String> map = {
      'id': id.toString(),
      'username': username.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      'website': website.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
  UserQueryParameters({this.id, this.username, this.email, this.phone, this.website});
}