import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/EventBus.dart';
import 'package:wiseesl_pda/data//ProductInfo.dart';
import 'tabs/Products.dart';
import 'tabs/Bind.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  Tabs({
    Key key,
  }) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

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
        physics:NeverScrollableScrollPhysics() ,
        children: this._pageList,
        onPageChanged: (index) {
          _currentIndex = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
            _pageController.jumpToPage(this._currentIndex);
          });
        },
        iconSize: 24.0,
        fixedColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "商品"),
          BottomNavigationBarItem(icon: Icon(Icons.outbond), label: "绑定"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Colors.blue,
      //   onPressed: () {
      //     setState(() {
      //       eventBus.fire(new AddProductContentEvent('添加商品'));
      //     });
      //     print("FloatingActionButton");
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
