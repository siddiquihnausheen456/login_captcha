import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:overlay_support/overlay_support.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../model/login_model.dart';

class ShowOtpWidget extends StatelessWidget {
  final LoginResponse? response;
  final LoginBloc? bloc;
  final String? mobileNumber;

  ShowOtpWidget({Key? key, this.response, this.bloc, this.mobileNumber})
      : super(key: key);

  final TextEditingController captchaController = TextEditingController();
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Enter Code"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image.network(
                      "https://img.freepik.com/premium-vector/unlock-password-correct-success-login-concept-vector-illustration-flat-design_662353-282.jpg")),
              const SizedBox(
                height: 20,
              ),
              Text(
                "OTP Verification",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Text(
                  "Enter OTP code: ${response?.userLoginAPI?.response?[0].otpCode}",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OTPTextField(
                  length: 6,
                  spaceBetween: 5,
                  fieldWidth: 45,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  onCompleted: (pin) {
                    otpCode = pin;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Captcha: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
              Transform.rotate(
                angle: 270.0,
                child: Text(
                  response?.userLoginAPI?.response?[0].captchaCode,
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.double),
                ),
              ),
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width / 3,
                child: TextField(
                  controller: captchaController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: "Enter captcha",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.normal)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF488dd4),
                      fixedSize: Size(MediaQuery.of(context).size.width, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    if ((otpCode?.isNotEmpty ?? false) &&
                        captchaController.text ==
                            response?.userLoginAPI?.response?[0].captchaCode) {
                      bloc?.add(UserLoginEvent(
                          mobileNumber: mobileNumber,
                          otp: response?.userLoginAPI?.response?[0].otpCode,
                          captcha: captchaController.text));
                      Navigator.pop(context);
                    } else {
                      showSimpleNotification(
                          const Text("Please fill all info correctly."),
                          background: Colors.orangeAccent);
                    }
                  },
                  child: const Text(
                    "VERIFY & CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
