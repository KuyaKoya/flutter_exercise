import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Geo {
  final double lat;
  final double lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() =>{
      'lat': lat,
      'lng': lng,
    };

  Geo.fromJson(Map<String, dynamic> json) : 
    lat = double.parse(json['lat']),
    lng = double.parse(json['lng']);
    
}
