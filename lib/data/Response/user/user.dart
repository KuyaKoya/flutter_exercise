import 'package:json_annotation/json_annotation.dart';

import '../response_data.dart';
import 'address/address.dart';
import 'company/company.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User implements ResponseData {
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

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
  
  @override
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}
