import 'package:flutter/material.dart';
import 'package:wiseesl_pda/services/ScreenAdapter.dart';
import 'package:wiseesl_pda/view/MyTextField.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Padding(
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
                  Container(
                    width: ScreenAdapter.width(400),
                    height: ScreenAdapter.height(58),
                    child: ElevatedButton(
                      child: Text('确认修改'),
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
                        print("确认修改");
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
