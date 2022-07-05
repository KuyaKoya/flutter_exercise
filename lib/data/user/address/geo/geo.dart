import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
  final double lat;
  final double lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
