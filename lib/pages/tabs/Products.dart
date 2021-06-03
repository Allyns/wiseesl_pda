import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return DefaultTabController(
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
            _getProductLists(),
            // _addProdussscts(),

//添加商品视图
            Padding(
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
                              child: _MyTextField(
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
                              child: _MyTextField(
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
                        _MyTextField(
                          text: "名称",
                        ),
                        SizedBox(height: 14),
                        _MyTextField(
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
                                "打开其他信息 (选填)",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )),
                        SizedBox(height: 14),
                        Visibility(
                          visible: isVisible,
                          child: Column(
                            children: <Widget>[
                              _MyTextField(
                                text: "单位",
                              ),
                              SizedBox(height: 14),
                              _MyTextField(
                                text: "品牌",
                              ),
                              SizedBox(height: 14),
                              _MyTextField(
                                text: "产地",
                              ),
                              SizedBox(height: 14),
                              _MyTextField(
                                text: "描述",
                              ),
                              SizedBox(height: 14),
                              _MyTextField(
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
          ],
        ),
      ),
    );
  }
}

Widget _getProductLists() {
  return ListView(
    children: <Widget>[
      ListTile(title: Text("我在写代码")),
      ListTile(title: Text("我在写代码")),
      ListTile(title: Text("我在写代码"))
    ],
  );
}

Widget _addProdussscts() {
  return Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20),
              _MyTextField(
                text: "EAN",
              ),
              SizedBox(height: 14),
              _MyTextField(
                text: "SKU",
              ),
              SizedBox(height: 14),
              _MyTextField(
                text: "名称",
              ),
              SizedBox(height: 14),
              _MyTextField(
                text: "价格",
              ),
              SizedBox(height: 14),
              Container(
                  height: ScreenAdapter.height(50),
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "其他信息",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
              SizedBox(height: 14),
              Visibility(
                visible: true,
                child: Column(
                  children: <Widget>[
                    _MyTextField(
                      text: "单位",
                    ),
                    SizedBox(height: 14),
                    _MyTextField(
                      text: "品牌",
                    ),
                    SizedBox(height: 14),
                    _MyTextField(
                      text: "产地",
                    ),
                    SizedBox(height: 14),
                    _MyTextField(
                      text: "描述",
                    ),
                    SizedBox(height: 14),
                    _MyTextField(
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
      ));
}

class _MyTextField extends StatelessWidget {
  final text;
  final width;
  final double height;

  const _MyTextField(
      {this.text = '', this.width = double.infinity, this.height = 70.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(height),
      width: double.infinity,
      child: TextField(
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: text),
      ),
    );
  }
}
