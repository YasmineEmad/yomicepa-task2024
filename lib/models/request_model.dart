class ReturnRequestListModel {
  final List<ReturnRequestItem> content;
  final Pageable pageable;
  final int totalElements;
  final int totalPages;
  final bool last;
  final int number;
  final Sort sort;
  final int size;
  final int numberOfElements;
  final bool first;
  final bool empty;

  ReturnRequestListModel({
    required this.content,
    required this.pageable,
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.number,
    required this.sort,
    required this.size,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  factory ReturnRequestListModel.fromJson(Map<String, dynamic> json) {
    return ReturnRequestListModel(
      content: (json['content'] as List<dynamic>)
          .map((item) => ReturnRequestItem.fromJson(item))
          .toList(),
      pageable: Pageable.fromJson(json['pageable']),
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      last: json['last'],
      number: json['number'],
      sort: Sort.fromJson(json['sort']),
      size: json['size'],
      numberOfElements: json['numberOfElements'],
      first: json['first'],
      empty: json['empty'],
    );
  }
}

class ReturnRequestItem {
  final ReturnRequest returnRequest;
  final int numberOfItems;
  final int numberOfReports;
  final int numberOfShipments;

  ReturnRequestItem({
    required this.returnRequest,
    required this.numberOfItems,
    required this.numberOfReports,
    required this.numberOfShipments,
  });

  factory ReturnRequestItem.fromJson(Map<String, dynamic> json) {
    return ReturnRequestItem(
      returnRequest: ReturnRequest.fromJson(json['returnRequest']),
      numberOfItems: json['numberOfItems'],
      numberOfReports: json['numberOfReports'],
      numberOfShipments: json['numberOfShipments'],
    );
  }
}

class ReturnRequest {
  final int id;
  final int createdAt;
  final Pharmacy pharmacy;
  final String? preferredDate;
  final String returnRequestStatus;
  final String returnRequestStatusLabel;
  final String serviceType;

  ReturnRequest({
    required this.id,
    required this.createdAt,
    required this.pharmacy,
    required this.preferredDate,
    required this.returnRequestStatus,
    required this.returnRequestStatusLabel,
    required this.serviceType,
  });

  factory ReturnRequest.fromJson(Map<String, dynamic> json) {
    return ReturnRequest(
      id: json['id'],
      createdAt: json['createdAt'],
      pharmacy: Pharmacy.fromJson(json['pharmacy']),
      preferredDate: json['preferredDate'],
      returnRequestStatus: json['returnRequestStatus'],
      returnRequestStatusLabel: json['returnRequestStatusLabel'],
      serviceType: json['serviceType'],
    );
  }
}

class Pharmacy {
  final int id;
  final User user;
  final bool enabled;
  final String doingBusinessAs;

  Pharmacy({
    required this.id,
    required this.user,
    required this.enabled,
    required this.doingBusinessAs,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      id: json['id'],
      user: User.fromJson(json['user']),
      enabled: json['enabled'],
      doingBusinessAs: json['doingBusinessAs'],
    );
  }
}

class User {
  final int id;
  final String username;
  final String role;
  final bool activated;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.activated,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      role: json['role'],
      activated: json['activated'],
    );
  }
}

class Pageable {
  final Sort sort;
  final int offset;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: Sort.fromJson(json['sort']),
      offset: json['offset'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      paged: json['paged'],
      unpaged: json['unpaged'],
    );
  }
}

class Sort {
  final bool sorted;
  final bool unsorted;
  final bool empty;

  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json['sorted'],
      unsorted: json['unsorted'],
      empty: json['empty'],
    );
  }
}
