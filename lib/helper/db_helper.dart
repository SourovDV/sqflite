
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/data/user_data_model.dart';

class DbHelper{
  static Database ? _db;
  static const String _dbName = "expense_tracker.db";
  static const int _version = 1;
  static const String tableTransaction = "transactions";

  //database instance create

static Future<Database> get database async{
  if(_db != null) return _db!;
  _db = await _initDb();
  return _db!;
}

//create a path
static Future<Database> _initDb()async{
  final pathName = await getDatabasesPath();
  final path = join(pathName,_dbName);
  return openDatabase(
    path,
    version: _version,
    onCreate: _onCreate
  );
}

static Future<void> _onCreate(Database db , int version)async{
    await db.execute("""CREATE TABLE $tableTransaction(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        income TEXT,
        amount TEXT,
        note TEXT,
        date TEXT
    ) """);
  }

 //insert data means data save

static Future<int> insertTransaction(TransactionModel model)async{
  final db = await database;
  final id = await db.insert(tableTransaction, model.toMap());
  print("insert id $id");
  return id;
}
//read all data
static Future<List<TransactionModel>> getAllTransaction()async{
  final db = await database;
  final result = await db.query(tableTransaction,orderBy:"date DESC");
  return result.map((e)=>TransactionModel.fromMap(e)).toList();
}

//delete
static Future<int> deleteTransaction(int id)async{
  final db =await database;
  return await db.delete(tableTransaction,where: 'id=?',whereArgs: [id]);
}



}