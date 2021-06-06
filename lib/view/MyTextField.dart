import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';

///自带删除的ITextField
typedef void ITextFieldCallBack(String content);

class MyTextField extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final ITextFieldCallBack iTextFieldCallBack;

  MyTextField(
      {Key key,
      this.text = '',
      this.iTextFieldCallBack,
      this.width = double.infinity,
      this.height = 70.0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(widget.height),
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: widget.text),
        onChanged: (values) {
          setState(() {
            value = values;
            widget.iTextFieldCallBack(value);
          });
        },
      ),
    );
  }
}
