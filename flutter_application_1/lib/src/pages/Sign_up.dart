import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(Sign_up());

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'enter email',
                    border: OutlineInputBorder(),
                    hintText: 'email'),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'please check pw',
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);
                    // FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  },
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _register() async {
  //   final AuthResult result = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: _emailController.text, password: _passwordController.text);
  //   final FirebaseUser user = result.user;

  //   if (user == null) {
  //     final snackBar = SnackBar(
  //       context: Text('please try again'),
  //     );
  //     Scaffold.of(context).showSnackBar(snackbar)
  //   }
  // }
}
