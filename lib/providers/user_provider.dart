import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/api_handler.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';

class UserProvider with ChangeNotifier {
  String _token = '';

  String get token => _token;

  Future<void> login(UserModel user) async {
    final response = await ApiHandler.post('/auth', user.toJson(),"");

    if (response['token'] != null) {
      _token = response['token'];
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }
}
