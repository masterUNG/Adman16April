// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    @required this.context,
  });

  void normalDialog({@required String title, @required String message}) {
    showDialog(
        context: context, builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
        ));
  }
}
