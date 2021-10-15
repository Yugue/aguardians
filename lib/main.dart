import 'package:flutter/material.dart';

import 'widgets/login_signup/Log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aguardians'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: 'En',
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 20,
                ),
                items: <String>['En'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey[300]),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 20.0),
            children: [
              const SizedBox(
                height: 70.0,
                child: DrawerHeader(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  margin: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Text('Drawer Header'),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: LoginSection(),
        ),
      ),
    );
  }
}
