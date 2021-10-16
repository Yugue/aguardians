import 'package:aguardians/logic/regex/input_validator_regex.dart';
import 'package:flutter/material.dart';

import 'input_forms.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({Key? key}) : super(key: key);

  @override
  _SignupUserState createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const EmailInputForm(),
        CustomInputForm(labelText: 'Password', validatorRule: passwordRule, errorMsg: passwordErrorMsg),
        CustomInputForm(labelText: 'Re-Password', validatorRule: passwordRule, errorMsg: passwordErrorMsg),
        CustomInputForm(labelText: 'Name', validatorRule: nameRule, errorMsg: nameErrorMsg),
        const SizedBox(
          width: 100.0,
          child: CustomDropdown(title: 'Gender', options: <String>['Male', 'Female', 'Other']),
        ),
        ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: const Text('Date of Birth')),
      ],
    );
  }
}

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.options,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButton(
          hint: Text(title),
          // isExpanded: true,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {}),
    );
  }
}
