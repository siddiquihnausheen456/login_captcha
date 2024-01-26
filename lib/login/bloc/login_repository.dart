
import 'dart:io';

import 'package:captcha_code_demo/login/networking/fetch_login_data.dart';

import '../model/login_model.dart';

abstract class LoginRepository{
Future<LoginResponse?> getLoginData(String? mobileNumber, String? otp, String? captcha);
}

class LoginRepositoryImp implements LoginRepository{
  @override
  Future<LoginResponse?> getLoginData(String? mobileNumber, String? otp, String? captcha) async{
  LoginResponse? response;
  Map<String, dynamic> data = {
    "MobileNo" : mobileNumber,
    "DeviceId" : "Device001",
    "OSType" : Platform.isAndroid ? "android" : "iOS",
    "CaptchaCode" : captcha ?? "",
    "OTP" : otp ?? "",
    "IsLoginFirst" : "",
    "FCMToken" : ""
  };

  response = await ApiClient.getLoginResponse(data);
  return response;

  }

}