import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';
import 'package:wiseesl_pda/view/MyTextField.dart';

class BindPage extends StatefulWidget {
  BindPage({Key key}) : super(key: key);

  _BindPageState createState() => _BindPageState();
}

class _BindPageState extends State<BindPage>
    with AutomaticKeepAliveClientMixin {
  //保持页面状态不刷新
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
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
            Tab(
              child: _bindList(),
            ),
            Tab(
              child: _addBind(),
            ),
            Tab(
              child: _unAddBind(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bindList() {
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
                        icon: Icon(Icons.outbond),
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
                            "康师傅冰红茶统一方便面",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
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
                            "235659748658",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: ScreenAdapter.width(420),
                          margin: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(12),
                              ScreenAdapter.height(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.height(20)),
                          child: Text(
                            "￥ 9.32",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
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
}

Widget _addBind() {
  return Padding(
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
                        },
                      )),
                ],
              ),
              SizedBox(height: 14),
              Stack(
                children: <Widget>[
                  Align(
                    child: MyTextField(
                      text: "ESL ID",
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
              SizedBox(height: 22),
              Container(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.height(58),
                child: ElevatedButton(
                  child: Text('绑定'),
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
                    print("绑定");
                  },
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ],
      ));
}

Widget _unAddBind() {
  return Padding(
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
                      text: "EAN / ESL ID",
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
              SizedBox(height: 22),
              Container(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.height(58),
                child: ElevatedButton(
                  child: Text('解绑'),
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
                    print("解绑");
                  },
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ],
      ));
}
