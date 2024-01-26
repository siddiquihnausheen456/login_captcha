import 'package:captcha_code_demo/login/model/login_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ResponseModel? responseModel;
  const HomeScreen({Key? key, this.responseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("User Data", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF488dd4),

      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(responseModel?.profileImage ?? "",
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20,),
            RichText(
                text: TextSpan(
              text: "User ID:  ",
              style: const TextStyle(fontSize: 17, color: Colors.black54),
              children: [
                TextSpan(
                  text:  responseModel?.userID,
            style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

            )
              ]
            )),
            RichText(
                text: TextSpan(
                text: "User Name:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.userName,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "Designation:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.designation,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "MobileNo:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.mobileNo,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "MemberType:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.memberType,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "FirmName:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.firmName,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "DateOfBirth:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.dateOfBirth,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),


                  )
                ]
            )),
            RichText(text: TextSpan(
                text: "Address:  ",
                style: const TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(
                    text:  responseModel?.address,
                    style: const TextStyle(fontSize: 19, color: Color(0xFF488dd4)),

                  )
                ]
            ))

          ]
        ),
      ),
    );

  }
}
