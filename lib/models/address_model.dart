class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Address({this.city, this.street, this.suite, this.zipcode});

  factory Address.fromMap(Map<String, dynamic> address) {
    return Address(
      street: address['street'],
      suite: address['suite'],
      city: address['city'],
      zipcode: address['zipcode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }
}
