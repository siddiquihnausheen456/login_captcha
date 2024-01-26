import 'package:captcha_code_demo/login/bloc/login_bloc.dart';
import 'package:captcha_code_demo/login/bloc/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'login/widget/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  BlocProvider(create: (BuildContext context) => LoginBloc(LoginRepositoryImp()),
          child: const LoginScreen(),
        )
      ),
    );
  }
}


