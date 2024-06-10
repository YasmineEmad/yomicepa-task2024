class PharmacyModel {
  final int pharmacyId;
  final String doingBusinessAs;
  final int numberOfReturns;
  final bool enabled;

  PharmacyModel({
    required this.pharmacyId,
    required this.doingBusinessAs,
    required this.numberOfReturns,
    required this.enabled,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      pharmacyId: json['pharmacyId'],
      doingBusinessAs: json['doingBusinessAs'],
      numberOfReturns: json['numberOfReturns'],
      enabled: json['enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pharmacyId': pharmacyId,
      'doingBusinessAs': doingBusinessAs,
      'numberOfReturns': numberOfReturns,
      'enabled': enabled,
    };
  }
}

