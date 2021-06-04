import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';
import 'package:wiseesl_pda/view/MyTextField.dart';

class ServiceSettingPage extends StatefulWidget {

  ServiceSettingPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ServiceSettingPageState();
}

class ServiceSettingPageState extends State<ServiceSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("服务器设置"),
      ),

      body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 14),
                  MyTextField(
                    text: "IP地址/域名",
                  ),
                  SizedBox(height: 14),
                  MyTextField(
                    text: "端口",
                  ),
                  SizedBox(height: 14),
                  MyTextField(
                    text: "店铺用户名称",
                  ),
                  SizedBox(height: 28),
                  Container(
                    width: ScreenAdapter.width(400),
                    height: ScreenAdapter.height(58),
                    child: ElevatedButton(
                      child: Text('确定'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.blue),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 18),
                ],
              ),
            ],
          )),
    );
  }
}
