import 'package:aguardians/logic/regex/input_validator_regex.dart';
import 'package:aguardians/widgets/common/title_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'input_forms.dart';
import 'sign_up.dart';

/// Widget responsible for the homepage login.
class LoginSection extends StatefulWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  late String? _userEmail;
  late String? _userPassword;
  late String? _loginErrorMsg;

  @override
  void initState() {
    _userEmail = '';
    _userPassword = '';
    _loginErrorMsg = null;
    super.initState();
  }

  void userEmailSetter(String? email) {
    setState(() {
      _userEmail = email;
    });
  }

  void userPasswordSetter(String? password) {
    setState(() {
      _userPassword = password;
    });
  }

  void loginErrorMsgSetter(String? msg) {
    setState(() {
      _loginErrorMsg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleWithMessage(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.subtitle1,
                children: <TextSpan>[
                  const TextSpan(text: 'Do not have an account? Try '),
                  TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return const SignupPage();
                            },
                          ));
                        }),
                ],
              ),
            ),
          ),
          CustomInputForm(
            labelText: 'Email',
            errorMsg: 'Email format is incorrect!',
            stateModifier: userEmailSetter,
          ),
          CustomInputForm(
            labelText: 'Password',
            validatorRule: passwordRule,
            errorMsg: passwordErrorMsg,
            stateModifier: userPasswordSetter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextButton(
              onPressed: () {
                // TODO: add forgot your password based on the email address provided
              },
              child: const Text('Forgot your password?'),
            ),
          ),
          if (_loginErrorMsg != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(_loginErrorMsg!, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
            ),
          ElevatedButton(
            onPressed: () async {
              loginErrorMsgSetter(null);
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: _userEmail!, password: _userPassword!);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  loginErrorMsgSetter('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  loginErrorMsgSetter('Wrong password provided for that user.');
                } else {
                  loginErrorMsgSetter(e.message);
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sign in', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
