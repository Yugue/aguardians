import 'package:flutter/material.dart';

class MessageNotifier extends StatelessWidget {
  const MessageNotifier({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: msg == null
          ? null
          : Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(msg!, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
            ),
    );
  }
}
