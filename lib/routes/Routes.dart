import 'package:flutter/material.dart';
import 'package:wiseesl_pda/pages/Login.dart';
import 'package:wiseesl_pda/pages/ServiceSetting.dart';
import 'package:wiseesl_pda/pages/ProductDetailPage.dart';
import '../pages/Tabs.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/login': (context) => LoginPage(),
  '/serviceSetting': (context) => ServiceSettingPage(),
  '/productDetails': (context) => ProductDetailsPage(),
  // '/registerSecond': (context,{arguments}) => RegisterSecondPage(arguments: arguments),
};

//固定写法
// ignore: missing_return, top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
