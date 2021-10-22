import 'package:flutter/material.dart';

class PostingSection extends StatefulWidget {
  const PostingSection({Key? key}) : super(key: key);

  @override
  _PostingSectionState createState() => _PostingSectionState();
}

class _PostingSectionState extends State<PostingSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text('You are currently logged in.')],
    );
  }
}
