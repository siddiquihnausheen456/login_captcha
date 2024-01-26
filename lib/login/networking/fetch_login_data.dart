import 'package:dio/dio.dart';
import '../model/login_model.dart';


class ApiClient {
  static Future<LoginResponse?> getLoginResponse(Map<String,dynamic> body) async {
    Dio dio = Dio();

    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true
    ));

    LoginResponse? response;

     var data = await dio.post('http://sgfabricatordemo.netcarrots.in/SGFabricatorAPI/Service.svc/UserLoginAPI',
     data: body);
     response = LoginResponse.fromJson(data.data);
    return response;
  }
}