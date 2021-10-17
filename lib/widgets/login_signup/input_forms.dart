import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

typedef StateModifier = void Function(String data);

class CustomInputForm extends StatelessWidget {
  const CustomInputForm({
    Key? key,
    required this.labelText,
    this.validatorRule,
    this.errorMsg,
    this.stateModifier,
  }) : super(key: key);

  final String labelText;
  final RegExp? validatorRule;
  final String? errorMsg;
  final StateModifier? stateModifier;

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
      case 'Phone Number':
        return const Icon(Icons.call);
      default:
        return const Icon(Icons.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: labelText == 'Phone Number' ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        icon: returnIcon(labelText),
        labelText: labelText,
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      onChanged: (String data) {
        stateModifier!(data);
      },
      validator: (String? value) {
        if (labelText == 'Email') {
          return (EmailValidator.validate(value!)) ? null : errorMsg;
        }
        else if (validatorRule != null) {
          return (validatorRule!.hasMatch(value!)) ? null : errorMsg;
        }
      },
    );
  }
}
