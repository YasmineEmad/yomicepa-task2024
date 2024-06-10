import 'package:yomicepa_mobile_task/apis/api_handler.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';

class LoginApi {
  static const String baseUrl = 'https://portal-test.rxmaxreturns.com/rxmax';

    Future<UserModel> login(String username, String password) async {
      final response = await ApiHandler.post('/auth', {
        'username': username,
        'password': password,
      },"");
      return UserModel.fromJson(response);
    }
}
