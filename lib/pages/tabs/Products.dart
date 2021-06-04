import 'package:flutter/material.dart';
import 'package:wiseesl_pda/pages/Tabs.dart';
import 'package:wiseesl_pda/services/EventBus.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';
import 'package:wiseesl_pda/view/MyTextField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isVisible = false;
  var actionEventBus;
  int _initialIndex = 0;

  @override
  void initState() {
    super.initState();
    eventBus.on<AddProductContentEvent>().listen((event) {
      print("接受监听");
      // setState(() {
      //   _initialIndex = 1;
      // });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return DefaultTabController(
      initialIndex: _initialIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("商品"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[Tab(text: "商品列表"), Tab(text: "添加商品")],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //商品列表
            Tab(
              child: _getProductLists(context),
            ),
            //添加商品视图
            Tab(
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Stack(
                            children: <Widget>[
                              Align(
                                child: MyTextField(
                                  text: "EAN",
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.qr_code_scanner),
                                    onPressed: () {
                                      print("点击扫描");
                                      getQrcodeState()
                                          .then((value) => setState(() {
                                                setState(() {
                                                  Fluttertoast.showToast(
                                                      msg: "扫码内容=${value}",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.black45,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                });
                                              }));
                                    },
                                  )),
                            ],
                          ),
                          SizedBox(height: 14),
                          Stack(
                            children: <Widget>[
                              Align(
                                child: MyTextField(
                                  text: "SKU",
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.qr_code_scanner),
                                    onPressed: () {
                                      print("点击扫描");
                                    },
                                  )),
                            ],
                          ),
                          SizedBox(height: 14),
                          MyTextField(
                            text: "名称",
                          ),
                          SizedBox(height: 14),
                          MyTextField(
                            text: "价格",
                          ),
                          SizedBox(height: 14),
                          Container(
                              height: ScreenAdapter.height(50),
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isVisible) {
                                      isVisible = false;
                                    } else {
                                      isVisible = true;
                                    }
                                  });
                                },
                                child: Text(
                                  "填写其他信息 (选填)",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )),
                          SizedBox(height: 14),
                          Visibility(
                            visible: isVisible,
                            child: Column(
                              children: <Widget>[
                                MyTextField(
                                  text: "单位",
                                ),
                                SizedBox(height: 14),
                                MyTextField(
                                  text: "品牌",
                                ),
                                SizedBox(height: 14),
                                MyTextField(
                                  text: "产地",
                                ),
                                SizedBox(height: 14),
                                MyTextField(
                                  text: "描述",
                                ),
                                SizedBox(height: 14),
                                MyTextField(
                                  text: "等级",
                                ),
                                SizedBox(height: 14),
                              ],
                            ),
                          ),
                          Container(
                            width: ScreenAdapter.width(400),
                            height: ScreenAdapter.height(58),
                            child: ElevatedButton(
                              child: Text('确定添加'),
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
                                print("确定添加");
                              },
                            ),
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

//扫描二维码
Future<String> getQrcodeState() async {
  try {
    const ScanOptions options = ScanOptions(
      strings: {
        'cancel': '取消',
        'flash_on': '开启闪光灯',
        'flash_off': '关闭闪光灯',
      },
    );
    final ScanResult result = await BarcodeScanner.scan(options: options);
    return result.rawContent;
  } catch (e) {}
  return null;
}

Widget _getProductLists(BuildContext context) {
  return ListView(
    children: <Widget>[
      SizedBox(
        height: 14,
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, "/productDetails");
            print("商品详情");
          },
        ),
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, "/productDetails");
            // Navigator.pushNamed(ProductsPage, "/productDetails");
          },
        ),
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            print("商品详情");
          },
        ),
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            print("商品详情");
          },
        ),
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            print("商品详情");
          },
        ),
      ),
      Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.white,
        margin: EdgeInsets.all(4),
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.web_sharp),
                      iconSize: 40,
                    ),
                    Column(children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(10),
                            ScreenAdapter.height(30),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "名称:" + "康师傅冰红茶统一方便面",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(10)),
                        child: Text(
                          "EAN:" + "235659748658",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                      Container(
                        width: ScreenAdapter.width(420),
                        margin: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(12),
                            ScreenAdapter.height(10),
                            ScreenAdapter.width(20),
                            ScreenAdapter.height(8)),
                        child: Text(
                          "价格:" + "￥ 9.32",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenAdapter.height(170),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.width(140),
                      height: ScreenAdapter.width(70),
                      child: Text(
                        "绑定",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print("绑定");
                    },
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            print("商品详情");
          },
        ),
      ),
    ],
  );
}
