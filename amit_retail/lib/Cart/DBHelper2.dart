import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{
//static final _databaseName = "products_cart1.db";
  //static final _databaseVersion = 1;
  //static final table = 'products';

  static final DBHelper _instance=DBHelper.internal();
  DBHelper.internal();
  factory DBHelper()=>_instance;
  static Database? _db ;
  Future<Database?> createDB() async{
    if(_db !=null){
      return _db;
    }
    //Path ,name of DB data/database/courses.db
    String path=join(await getDatabasesPath(), "CartDB1.db");
    _db =await openDatabase(path,version: 1,onCreate:(Database db,int version) {
      db.execute(
          '''
          CREATE TABLE IF NOT EXISTS Product (
           id INTEGER PRIMARY KEY, name TEXT,title TEXT, categoryid INTEGER,description TEXT,price INTEGER,discount INTEGER, discounttype TEXT,currency TEXT, instock INTEGER,  avatar TEXT, pricefinal INTEGER,  pricefinaltext TEXT, itemnum INTEGER
          )
          '''
      );
    }, );
    return _db;
  }

  Future<int> insertProduct(Map<String, dynamic> product)async{
    Database? db=await createDB();
//   db.rawInsert(sql);
    return await db!.insert("Product", product, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List> allProducts()async{
    Database? db=await createDB();
    return db!.query("Product" );
  }

  Future<int>  delete(int id)async{
    Database? db=await createDB();
    return db!.delete("Product",where: 'id = ?',whereArgs: [id]);
  }
  Future<void>  deleteAll()async{
    Database? db=await createDB();
     db!.delete("Product",);
  }
}

// String id = 'id';
// String name = 'name';
// String title = 'title';
// String categoryid = 'category_id';
// String description = 'description';
// String price = 'price';
// String discount = 'discount';
// String discounttype = 'discount_type';
// String currency = 'curency';
// String instock = 'in_stock';
// String avatar = 'avatar';
// String pricefinal = 'price_final';
// String pricefinaltext = 'price_final_text';
// String itemnum = 'item_num';