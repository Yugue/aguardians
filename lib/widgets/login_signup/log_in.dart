import 'package:aguardians/widgets/common/title_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'sign_up.dart';

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
          const PasswordInputForm(),
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

class EmailInputForm extends StatelessWidget {
  const EmailInputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (EmailValidator.validate(value!)) ? null : 'Email format is incorrect!';
      },
    );
  }
}

class PasswordInputForm extends StatelessWidget {
  const PasswordInputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegExp passwordRule = RegExp(r'/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/');
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password',
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (passwordRule.hasMatch(value!))
            ? null
            : 'Password must be minimum eight characters, at least one letter, one number and one special character!';
      },
    );
  }
}
