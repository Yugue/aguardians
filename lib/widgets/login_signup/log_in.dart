import 'package:aguardians/logic/regex/input_validator_regex.dart';
import 'package:aguardians/widgets/common/title_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'input_forms.dart';
import 'sign_up.dart';

/// Widget responsible for the homepage login.
class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

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
          const EmailInputForm(),
          CustomInputForm(labelText: 'Password', validatorRule: passwordRule, errorMsg: passwordErrorMsg),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextButton(
              onPressed: () {
                // TODO: add forgot your password based on the email address provided
              },
              child: const Text('Forgot your password?'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Submit sign in to Firebase
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
