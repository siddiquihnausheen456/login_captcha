import 'package:captcha_code_demo/home/home_screen.dart';
import 'package:captcha_code_demo/login/bloc/login_bloc.dart';
import 'package:captcha_code_demo/login/bloc/login_event.dart';
import 'package:captcha_code_demo/login/bloc/login_state.dart';
import 'package:captcha_code_demo/login/model/login_model.dart';
import 'package:captcha_code_demo/login/widget/show_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc? _bloc;
  final TextEditingController mobileController = TextEditingController();
  bool isLoading = false;
  LoginResponse? loginResponse;

  @override
  void initState() {
    mobileController.text = "9900000000";
    _bloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return buildUI();
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginInitialState) {
          isLoading = true;
        } else if (state is LoginSuccessfulState) {
          isLoading = false;
          loginResponse = state.response;
          WidgetsFlutterBinding.ensureInitialized()
              .addPostFrameCallback((timeStamp) {
            if (loginResponse?.userLoginAPI?.response?[0].otpCode != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowOtpWidget(
                            response: loginResponse,
                            bloc: _bloc,
                            mobileNumber: mobileController.text,
                          )));
            } else if (loginResponse?.userLoginAPI?.errorCode == '0') {
              showSimpleNotification(
                  Text(loginResponse?.userLoginAPI?.result ?? ""),
                  background: Colors.lightGreen);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            responseModel:
                                loginResponse?.userLoginAPI?.response?[0],
                          )));
            }
          });
        } else if (state is LoginFailedState) {
          isLoading = false;
          WidgetsFlutterBinding.ensureInitialized()
              .addPostFrameCallback((timeStamp) {
            showSimpleNotification(Text(state.error), background: Colors.red);
          });
        }
      },
    ));
  }

  Widget buildUI() {
    return Stack(
      children: [
        Visibility(
            visible: isLoading,
            child: const Center(
                child: CircularProgressIndicator(
              color: Color(0xFF488dd4),
            ))),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(
                        "https://routemobile.com/wp-content/uploads/2023/02/Banner-1.png")),
                Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF488dd4)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter your Phone number",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  "We will send you the 6 digit verification code.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: mobileController,
                  cursorColor: const Color(0xFF488dd4),
                  decoration: const InputDecoration(
                    labelText: "Mobile No.",
                    labelStyle: TextStyle(color: Color(0xFF488dd4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
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
                      if (mobileController.text.isNotEmpty) {
                        _bloc?.add(UserLoginEvent(
                            mobileNumber: mobileController.text));
                      }
                    },
                    child: const Text(
                      "GENERATE OTP",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
