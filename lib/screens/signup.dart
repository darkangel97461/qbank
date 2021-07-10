import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qbankwithpdf/components/constants.dart';

import '../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _userEditingController,
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      decoration: kUserInputDecoration,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordEditingController,
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      decoration: kPasswordInputDecoration,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _confirmPasswordEditingController,
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      decoration: kConfirmPasswordInputDecoration,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
              ),
              MaterialButton(
                elevation: 2,
                color: kThemeColor,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_userEditingController.text == "4c" &&
                      _passwordEditingController.text == "fghFGH123!@#") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Splash(),),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Wrong Credentials",
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
