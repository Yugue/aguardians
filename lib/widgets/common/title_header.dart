import 'package:flutter/material.dart';

/// Widget that displays Aguardians and the main message.
class TitleWithMessage extends StatelessWidget {
  const TitleWithMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
