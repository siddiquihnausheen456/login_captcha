abstract class LoginEvent{}

class UserLoginEvent extends LoginEvent{
  String? mobileNumber;
  String? otp;
  String? captcha;
  UserLoginEvent({this.mobileNumber, this.otp, this.captcha});
}