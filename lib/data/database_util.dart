import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wiseesl_pda/data//ProductInfo.dart';

class DataBase {

  static final DataBase _instance = new DataBase.internal();

  factory DataBase() => _instance;

  static Database _db;
  String _dbName = 'witstecpda.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBase.internal();

  //初始化数据库，根据路径版本号新建数据库
  initDb() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    String p = await getDatabasesPath();
    String path = join(p, _dbName);
    var dataBase = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('数据库创建成功，version： 1');
    return dataBase;
  }

  _onCreate(Database db, int version) async {
    // When creating the db, create the table
    /*
*  cid : "CN101010100"
   * location : "北京"
   * parent_city : "北京"
   * admin_area : "北京"
   * cnty : "中国"
   * lat : "39.90498734"
   * lon : "116.4052887"
   * tz : "+8.00"
   * type : "city"*/
    await db
        .execute("CREATE TABLE productInfo (id INTEGER PRIMARY KEY, cid TEXT,eam "
            "TEXT,sku TEXT,name TEXT,price TEXT,grand TEXT,unit"
            " TEXT,placeOrigin TEXT,brand TEXT,description TEXT)");
    print("创建表成功！");
  }

  closeDB() {
    if (_db != null ) {
      _db.close();
      print("关闭成功！");
    }
  }

  insert(ProductInfo productInfo) async {

    // eam: String,
    // sku: String,
    // name: String,
    // price: Float,
    // grand:String,
    // unit: String,
    // place_of_origin: String,
    // brand: String,
    // description: String)

    var dbClient = await db;
    // ignore: missing_return
    dbClient.transaction((trx) {
      trx.rawInsert('INSERT INTO productInfo(cid,eam,sku,name,'
          'price,grand,unit,placeOrigin,brand,description) '
          'VALUES'
          '("${productInfo.cid}","${productInfo.eam}","${productInfo.sku}",'
          '"${productInfo.name}","${productInfo.price}","${productInfo.grand}","${productInfo.unit}","${productInfo.placeOrigin}","${productInfo.brand}","${productInfo.description}")');
    });
  }
  //
  Future<List<ProductInfo>> queryAll() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM productInfo');
    print(list);
    List<ProductInfo> basicList = ProductInfo.fromMapList(list);
    return basicList;
  }

  deleteLocation(String cid) async {
    var dbClient = await db;
    int count = await dbClient.rawDelete("delete from city where cid=?", [cid]);
    return count;
  }
}
