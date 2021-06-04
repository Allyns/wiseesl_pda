import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String userName;
  String password;
  bool isShowPassWord = false;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName: ' + userName + ' password: ' + password);
    }
  }

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Icon(
        Icons.supervised_user_circle,
        size: 60,
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: '用户名',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: '密码',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    // ignore: deprecated_member_use
    final forgetLabel = new FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, "/serviceSetting");
      },
      child: new Text(
        '服务器设置',
        style: new TextStyle(color: Colors.black54),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 24.0),
              email,
              SizedBox(
                height: 8.0,
              ),
              password,
              SizedBox(
                height: 24.0,
              ),
              Container(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.height(68),
                child: ElevatedButton(
                  child: Text('登录'),
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
                    // Navigator.pushNamed(context, "/");
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              forgetLabel
            ],
          ),
        ),
      ),
    );
  }
}
