import 'package:dio/dio.dart';
import '../utils/api.dart';

class UserModel {
  String email;
  String password;
  String username;

  UserModel(
      {required this.email, required this.password, required this.username});

  Dio dio = Dio();

  Future<bool> login() async {
    try {
      final response = await dio.post(
        Api.loginUrl,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Login failed: ${response.data}');
        return false;
      }
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data}');
      return false;
    }
  }

  Future<String> signup() async {
    try {
      final response = await dio.post(
        Api.signupUrl,
        data: {
          'email': email,
          'password': password,
          'username': username,
        },
      );
      print(response);
      if (response.statusCode == 201) {
        return "Success";
      }
      if (response.statusCode == 400)
         {
          return "Signup failed: ${response.data['data']}";
        }
      else{
        return "Unsuccessfull";
      }

    } on DioException catch (e) {
      print('Signup failed: ${e.response?.statusCode}');
      return '${e.response?.data['data']}';
    }
  }
}