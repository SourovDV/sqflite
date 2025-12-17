import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/data/user_data_model.dart';

class DbHelper{
  static Database? _db;
  static const String _dbName ="expense_tracker.db";
  static const int _version = 1;
  static const String tableTransaction = "transactions"; //table name,as if it will not wrong

//database instance ;
static Future<Database> get database async{
  if(_db !=null) return _db!;
  _db = await _initDb();
  return _db!;
}
// now we have to create database path

 static Future<Database> _initDb()async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath,_dbName);
  return openDatabase(
    path,
    version: _version,
    onCreate: _onCreate,
  );
 }

 static Future<void> _onCreate(Database db , int version)async{
    await db.execute('''CREATE TABLE $tableTransaction(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        amount INTEGER,
        category TEXT,
        note TEXT,
        date TEXT
      )''');
 }
//insert data means data save

static Future<int> insertTransaction(TransactionModel model)async{
  final db = await database;
  return await db.insert(tableTransaction, model.toMap());
}

  static Future<List<TransactionModel>> getAllTransactions() async {
    final db = await database;
    final result = await db.query(tableTransaction, orderBy: "date DESC");

    return result.map((e) => TransactionModel.fromMap(e)).toList();
  }
  static Future<int> deleteTransaction(int id) async {
    final db = await database;
    return await db.delete(
      tableTransaction,
      where: 'id = ?',
      whereArgs: [id],
    );
  }



}