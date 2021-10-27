import 'package:aguardians/logic/regex/input_validator_regex.dart';
import 'package:aguardians/widgets/common/message_notifier.dart';
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
  String? _userEmail;
  String? _userPassword;
  String? _loginMsg;

  @override
  void initState() {
    _userEmail = '';
    _userPassword = '';
    _loginMsg = null;
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

  void loginMsgSetter(String? msg) {
    setState(() {
      _loginMsg = msg;
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
            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
            child: TextButton(
              onPressed: () async {
                loginMsgSetter(null);
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: _userEmail!);
                  loginMsgSetter('A password reset email has been sent. Please check your spam!');
                } on FirebaseAuthException catch (e) {
                  loginMsgSetter(e.message);
                }
              },
              child: const Text('Forgot your password?'),
            ),
          ),
          MessageNotifier(msg: _loginMsg),
          ElevatedButton(
            onPressed: () async {
              loginMsgSetter(null);
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: _userEmail!, password: _userPassword!);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  loginMsgSetter('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  loginMsgSetter('Wrong password provided for that user.');
                } else {
                  loginMsgSetter(e.message);
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Log in', style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
