class UserEntity {
  final int id;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}

class Geo {
  final double lat;
  final double lng;

  Geo({
    required this.lat,
    required this.lng,
  });
}
