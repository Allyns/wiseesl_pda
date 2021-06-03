import 'package:flutter/material.dart';

class BindPage extends StatefulWidget {
  BindPage({Key key}) : super(key: key);

  _BindPageState createState() => _BindPageState();
}

class _BindPageState extends State<BindPage> with AutomaticKeepAliveClientMixin{

  //保持页面状态不刷新
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("绑定"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "绑定列表"),
              Tab(text: "新增绑定"),
              Tab(
                text: "解除绑定",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
