import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginResponse{
  @JsonKey(name: "UserLoginAPI")
  UserLoginAPI? userLoginAPI;

  LoginResponse({this.userLoginAPI});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);


}

@JsonSerializable()
class UserLoginAPI{
  @JsonKey(name: "ErrorCode")
  String? errorCode;
  @JsonKey(name: "Result")
  String? result;
  @JsonKey(name: "Response")
  List<ResponseModel>? response;

  UserLoginAPI({this.errorCode, this.result, this.response});

  factory UserLoginAPI.fromJson(Map<String, dynamic> json) => _$UserLoginAPIFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginAPIToJson(this);



}

@JsonSerializable()
class ResponseModel{
  @JsonKey(name: "UserID")
  String? userID;
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "Designation")
  String? designation;
  @JsonKey(name: "MobileNo")
  String? mobileNo;
  @JsonKey(name: "MemberType")
  String? memberType;
  @JsonKey(name: "FirmName")
  String? firmName;
  @JsonKey(name: "DateOfBirth")
  String? dateOfBirth;
  @JsonKey(name: "DateOfAnniversary")
  String? dateOfAnniversary;
  @JsonKey(name: "Language")
  String? language;
  @JsonKey(name: "Address")
  String? address;
  @JsonKey(name: "Option")
  String? option;
  @JsonKey(name: "CaptchaCode")
  dynamic captchaCode;
  @JsonKey(name: "OTPCode")
  dynamic otpCode;
  @JsonKey(name: "ProfileImage")
  String? profileImage;


  ResponseModel({this.userID,this.userName, this.designation, this.mobileNo, this.memberType,
    this.firmName, this.dateOfAnniversary, this.dateOfBirth, this.language, this.address, this.option, this.profileImage,
    this.captchaCode, this.otpCode});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);


}