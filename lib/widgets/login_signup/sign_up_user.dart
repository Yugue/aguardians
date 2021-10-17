import 'package:aguardians/logic/regex/input_validator_regex.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'input_forms.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({Key? key}) : super(key: key);

  @override
  _SignupUserState createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
  DateTime? selectedDate;

  Future<void> _selectDateOfBirth(BuildContext context) async {
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const EmailInputForm(),
        CustomInputForm(labelText: 'Password', validatorRule: passwordRule, errorMsg: passwordErrorMsg),
        CustomInputForm(labelText: 'Re-Password', validatorRule: passwordRule, errorMsg: passwordErrorMsg),
        CustomInputForm(labelText: 'Name', validatorRule: nameRule, errorMsg: nameErrorMsg),
        const SizedBox(
          width: 100.0,
          child: CustomDropdown(title: 'Gender', options: <String>['Male', 'Female', 'Other']),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                _selectDateOfBirth(context);
              },
              child: const Text('Date of Birth'),
            ),
            const SizedBox(width: 20.0),
            if (selectedDate != null) Text(DateFormat('yyyy-MM-dd').format(selectedDate!)),
          ],
        ),
        const CustomInputForm(labelText: 'Phone Number'),
        const SizedBox(height: 20.0),
        OutlinedButton(onPressed: () {}, child: const Text('Add a Profile Picture')),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ElevatedButton(onPressed: () {}, child: const Text('Register')),
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
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
