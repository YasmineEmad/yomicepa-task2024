import 'package:yomicepa_mobile_task/models/pharmacy_link_model.dart';

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
    var links = json['pharmaciesLinks'] as List;
    List<PharmacyLink> pharmacyLinks =
    links.map((link) => PharmacyLink.fromJson(link)).toList();

    return WholesalerModel(
      id: json['id'],
      name: json['name'],
      accountNumber: json['accountNumber'],
      pharmaciesLinks: pharmacyLinks,
    );
  }
}