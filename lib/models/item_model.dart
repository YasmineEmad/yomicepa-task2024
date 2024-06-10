class AllItemsModel {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String ndc;
  final String description;
  final String manufacturer;
  final String packageSize;
  final String requestType;
  final String name;
  final String strength;
  final String dosage;
  final double fullQuantity;
  final double partialQuantity;
  final String expirationDate;
  final String status;
  final String lotNumber;
  final double expectedReturnValue;
  final double actualReturnValue;
  final String? adminComment;

  AllItemsModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.ndc,
    required this.description,
    required this.manufacturer,
    required this.packageSize,
    required this.requestType,
    required this.name,
    required this.strength,
    required this.dosage,
    required this.fullQuantity,
    required this.partialQuantity,
    required this.expirationDate,
    required this.status,
    required this.lotNumber,
    required this.expectedReturnValue,
    required this.actualReturnValue,
    this.adminComment,
  });

  factory AllItemsModel.fromJson(Map<String, dynamic> json) {
    return AllItemsModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      ndc: json['ndc'] ?? '8040-4444-333',
      description: json['description'] ?? 'This is a new drug',
      manufacturer: json['manufacturer'] ?? 'Nicolas LLC',
      packageSize: json['packageSize'] ?? '200',
      requestType: json['requestType'] ?? 'csc',
      name: json['name'] ?? 'Best Item Name',
      strength: json['strength'] ?? 'strong',
      dosage: json['dosage'] ?? 'alssot',
      fullQuantity: json['fullQuantity'] ?? '500',
      partialQuantity: json['partialQuantity'] ?? '100',
      expirationDate: json['expirationDate'] ?? '2021-08',
      status: json['status'] ?? 'PENDING',
      lotNumber: json['lotNumber'] ?? '1231313',
      expectedReturnValue: json['expectedReturnValue'].toDouble(),
      actualReturnValue: json['actualReturnValue'].toDouble(),
      adminComment: json['adminComment'],
    );
  }
}



class ItemModel {
  final String ndc;
  final String description;
  final String manufacturer;
  final String packageSize;
  final String requestType;
  final String name;
  final String strength;
  final String dosage;
  final String fullQuantity;
  final String partialQuantity;
  final String expirationDate;
  final String status;
  final String lotNumber;

  ItemModel({
    required this.ndc,
    required this.description,
    required this.manufacturer,
    required this.packageSize,
    required this.requestType,
    required this.name,
    required this.strength,
    required this.dosage,
    required this.fullQuantity,
    required this.partialQuantity,
    required this.expirationDate,
    required this.status,
    required this.lotNumber,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      ndc: json['ndc'] ?? '8040-4444-333',
      description: json['description'] ?? 'This is a new drug',
      manufacturer: json['manufacturer'] ?? 'Nicolas LLC',
      packageSize: json['packageSize'] ?? '200',
      requestType: json['requestType'] ?? 'csc',
      name: json['name'] ?? 'Best Item Name',
      strength: json['strength'] ?? 'strong',
      dosage: json['dosage'] ?? 'alssot',
      fullQuantity: json['fullQuantity'] ?? '500',
      partialQuantity: json['partialQuantity'] ?? '100',
      expirationDate: json['expirationDate'] ?? '2021-08',
      status: json['status'] ?? 'PENDING',
      lotNumber: json['lotNumber'] ?? '1231313',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ndc': ndc,
      'description': description,
      'manufacturer': manufacturer,
      'packageSize': packageSize,
      'requestType': requestType,
      'name': name,
      'strength': strength,
      'dosage': dosage,
      'fullQuantity': fullQuantity,
      'partialQuantity': partialQuantity,
      'expirationDate': expirationDate,
      'status': status,
      'lotNumber': lotNumber,
    };
  }
}
