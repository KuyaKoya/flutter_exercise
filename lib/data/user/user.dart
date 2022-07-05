import 'package:json_annotation/json_annotation.dart';

import 'address/address.dart';
import 'company/company.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
