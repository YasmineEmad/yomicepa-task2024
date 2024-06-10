class UserInfo {
  final int id;
  final String createdAt;
  final String? updatedAt;
  final String username;
  final String email;
  final String role;
  final String? phoneNumber;
  final bool activated;

  UserInfo({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.username,
    required this.email,
    required this.role,
    this.phoneNumber,
    required this.activated,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phoneNumber'],
      activated: json['activated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username,
      'email': email,
      'role': role,
      'phoneNumber': phoneNumber,
      'activated': activated,
    };
  }
}

