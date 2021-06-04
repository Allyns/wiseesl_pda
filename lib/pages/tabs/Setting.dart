import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "设置",
            style: TextStyle(color: Colors.black54),
          )),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.infinity,
            height: ScreenAdapter.height(200),
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      icon: Icon(Icons.supervised_user_circle),
                      iconSize: 60,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                ),
                Container(
                  child: Text(
                    "1839565349@qq.com",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.black45),
                  title: Text("服务器设置"),
                  onTap: () {
                    Navigator.pushNamed(context, "/serviceSetting");
                  },
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.black45),
                  title: Text("隐私政策与用户协议"),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.black45),
                  title: Text("实验室"),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.black45),
                  title: Text("关于"),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "关于=flutter开发",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black45,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.black45),
                  title: Text(
                    "退出登录",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return new AlertDialog(
                          title: new Text('退出登录'),
                          content: new SingleChildScrollView(
                            child: new ListBody(
                              children: <Widget>[
                                new Text('确定要退出登录吗?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () {
                                print('yes...');
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('确定'),
                              onPressed: () {
                                print('no...');
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      print(val);
                    });
                  },
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
