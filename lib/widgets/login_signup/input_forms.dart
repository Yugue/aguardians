import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomInputForm extends StatelessWidget {
  const CustomInputForm({
    Key? key,
    required this.labelText,
    this.validatorRule,
    this.errorMsg,
  }) : super(key: key);

  final String labelText;
  final RegExp? validatorRule;
  final String? errorMsg;

  Icon returnIcon(String labelText) {
    switch (labelText) {
      case 'Email':
        return const Icon(Icons.email);
      case 'Password':
        return const Icon(Icons.lock);
      case 'Re-Password':
        return const Icon(Icons.lock);
      case 'Name':
        return const Icon(Icons.badge);
      default:
        return const Icon(Icons.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: returnIcon(labelText),
        labelText: labelText,
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        if (validatorRule != null) {
          return (validatorRule!.hasMatch(value!)) ? null : errorMsg;
        }
      },
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
