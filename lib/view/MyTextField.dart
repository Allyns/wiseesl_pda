import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';

class MyTextField extends StatelessWidget {
  final text;
  final width;
  final double height;

  const MyTextField(
      {this.text = '', this.width = double.infinity, this.height = 70.0});

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      height: ScreenAdapter.height(height),
      width: double.infinity,
      child: TextField(
        decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: text),
      ),
    );
  }
}