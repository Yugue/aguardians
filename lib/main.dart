import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black54),
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
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
                iconSize: 24,
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
      ),
    );
  }
}
