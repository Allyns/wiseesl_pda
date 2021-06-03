import 'package:flutter/material.dart';
import 'tabs/Products.dart';
import 'tabs/Bind.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {

  Tabs({Key key,}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex=0;
  //创建页面控制器
  var _pageController;

  List<Widget> _pageList = [
    ProductsPage(),
    BindPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    //页面控制器初始化
    _pageController = new PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: this._pageList,
        onPageChanged: (index) {
          _currentIndex = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
            //页面控制器进行跳转
            _pageController.jumpToPage(this._currentIndex);
          });
        },
        iconSize: 24.0,
        //icon的大小
        fixedColor: Colors.lightBlue,
        //选中的颜色
        type: BottomNavigationBarType.fixed,
        //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "商品"),
          BottomNavigationBarItem(icon: Icon(Icons.outbond), label: "绑定"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
    );
  }
}
