class PharmacyLink {
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final int pharmacyId;
  final int wholesalerId;
  final bool primary;

  PharmacyLink({
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.pharmacyId,
    required this.wholesalerId,
    required this.primary,
  });

  factory PharmacyLink.fromJson(Map<String, dynamic> json) {
    return PharmacyLink(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      pharmacyId: json['pharmacyId'],
      wholesalerId: json['wholesalerId'],
      primary: json['primary'],
    );
  }
}

class WholesalerModel {
  final int id;
  final String name;
  final String? accountNumber;
  final List<PharmacyLink> pharmaciesLinks;

  WholesalerModel({
    required this.id,
    required this.name,
    this.accountNumber,
    required this.pharmaciesLinks,
  });

  factory WholesalerModel.fromJson(Map<String, dynamic> json) {
    var pharmacyLinksList = json['pharmaciesLinks'] as List;
    List<PharmacyLink> pharmaciesLinks =
    pharmacyLinksList.map((link) => PharmacyLink.fromJson(link)).toList();

    return WholesalerModel(
      id: json['id'],
      name: json['name'],
      accountNumber: json['accountNumber'],
      pharmaciesLinks: pharmaciesLinks,
    );
  }
}
