class User {
  final int? id;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    this.id,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
}

class Geo {
  final double? lat;
  final double? lng;

  Geo({
    this.lat,
    this.lng,
  });
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });
}
