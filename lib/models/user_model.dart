import 'package:yomicepa_mobile_task/models/user_info_model.dart';

class UserModel {
  final String token;
  final UserInfo userInfo;

  UserModel({
    required this.token,
    required this.userInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      userInfo: UserInfo.fromJson(json['userInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userInfo': userInfo.toJson(),
    };
  }
}
