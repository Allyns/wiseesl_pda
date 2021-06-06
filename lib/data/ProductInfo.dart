class ProductInfo{
  // eam: String,
  // sku: String,
  // name: String,
  // price: Float,
  // grand:String,
  // unit: String,
  // place_of_origin: String,
  // brand: String,
  // description: String)

  String cid;
  String eam;
  String sku;
  String name;
  String price;
  String grand;
  String unit;
  String placeOrigin;
  String brand;
  String description;

  static ProductInfo fromMap(Map<String, dynamic> map) {
    ProductInfo basicListBean = new ProductInfo();
    basicListBean.cid = map['cid'];
    basicListBean.eam = map['eam'];
    basicListBean.sku = map['sku'];
    basicListBean.name = map['name'];
    basicListBean.price = map['price'];
    basicListBean.grand = map['grand'];
    basicListBean.unit = map['unit'];
    basicListBean.placeOrigin = map['placeOrigin'];
    basicListBean.brand = map['brand'];
    basicListBean.description = map['description'];
    return basicListBean;
  }

  static List<ProductInfo> fromMapList(dynamic mapList) {
    List<ProductInfo> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}