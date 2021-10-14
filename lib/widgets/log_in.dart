import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Aguardians", style: Theme.of(context).textTheme.headline3),
            ),
            Text(
              "Free accompanying services for the asian communities. You can use this service for entirely free of charge, or sign up as a volunteer to help people around you.",
              style: Theme.of(context).textTheme.subtitle1,
            ),
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
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ),
            EmailInputForm(),
            PasswordInputForm(),
          ],
        ),
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
        icon: Icon(Icons.email),
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
