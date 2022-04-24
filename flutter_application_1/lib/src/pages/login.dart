//ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/Sign_up.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/src/pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  KakaoContext.clientId = "71c004e121e337a95b8db8d73f8df969";
  runApp(LoginWidget());
}

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);
  //구글 로그인 소스 코드
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //카카오 로그인 소스 코드
  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }

  //로그인 버튼 구현
  @override
  Widget build(BuildContext context) {
    //로그인 구현하기
    return Scaffold(
      appBar: AppBar(
        title: Text('SNS Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //로그인
            // TextFormField(
            //   validator: (value) {
            //     if (value != null && value.isEmpty) {
            //       return 'Enter some text';
            //     } else {
            //       return null;
            //     }
            //   },
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Enter something',
            //     labelText: 'Enter username',
            //   ),
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value != null && value.isEmpty) {
            //       return 'Enter some text';
            //     } else {
            //       return null;
            //     }
            //   },
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Enter something',
            //     labelText: 'Enter password',
            //   ),
            // ),
            // TextButton(
            //   onPressed: signinwithCre,
            //   style: TextButton.styleFrom(
            //     primary: Colors.blue,
            //     backgroundColor: Colors.white,
            //   ),
            //   child: Text('Login'),
            // ),
            // RaisedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Sign_up()));
            //   },
            //   child: Text('Register'),
            // ),
            //구글 로그인
            TextButton(
              onPressed: signInWithGoogle,
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
              child: Text('Google Login'),
            ),
            //카카오 로그인
            TextButton(
              onPressed: _loginButtonPressed,
              style: TextButton.styleFrom(
                primary: Colors.yellow,
                backgroundColor: Colors.black,
              ),
              child: Text('Kakao Login'),
            ),
          ],
        ),
      ),
    );
  }
}
