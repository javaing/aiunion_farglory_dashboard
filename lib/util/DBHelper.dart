import 'package:far_glory_construction_dashboard/util/Utils.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DBHelper {
  static const String table = "IN_OUT";

  static const String IN = "IN";
  static const String OUT = "OUT";
  static const String x = "X";
  static const String ok = "V";

  static const String EnterChar = "\n";

  // make this a singleton class
  //DBHelper._privateConstructor();
  //static final DBHelper instance = DBHelper._privateConstructor();

  // only have a single app-wide reference to the database
  Database? _database;
  // Future<Database?> get database async {
  //   if (_database != null) return _database;
  //   // lazily instantiate the db the first time it is accessed
  //   _database = await _initDatabase();
  //   print('art DB isOpen:${_database?.isOpen}');
  //   return _database;
  // }

  DBHelper() {
    _initDatabase();
  }

  Future<void> _initDatabase()  async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_db.db'),
      onCreate: (db, version) {
        print('art 0615 db onCreate');
        return db.execute(
          'CREATE TABLE $table (id INTEGER PRIMARY KEY, cid INTEGER, deviceId TEXT,in_out TEXT, faceId INTEGER, faceTypeId INTEGER, time TEXT, OK TEXT , IN_TOTAL INTEGER, IN_DEDUPLICATE INTEGER, OUT_TOTAL INTEGER, OUT_DEDUPLICATE INTEGER, bigIN INTEGER, bigDeIN INTEGER, bigOUT INTEGER, bigDeOUT INTEGER, Remain INTEGER)',
        );
      },
      onUpgrade: (db, oldver, newver) {
        print('art 0615 db onUpgrade');
        writeFileAppend("art 0615 Sqlite ALTER TABLE ", 'socket_${getYYYYMMDD()}.txt');
        return db.execute("ALTER TABLE $table ADD COLUMN cid INTEGER DEFAULT 0");
      },
      version: 2,
    );
  }

  Future<List<Map<String, Object?>>?>  getAllData()  async {

    return await _database?.rawQuery('SELECT * FROM $table');

    //return await _database?.query(table);
    //Database db = await DatabaseHelper.instance.database;

    // get all rows
    //List<Map> result = await db.query(DatabaseHelper.table);
  }


  //deviceId	in_out	faceId	FaceTypeId	time	OK	IN_TOTAL	IN_DEDUPLICATE	OUT_TOTAL	OUT_DEDUPLICATE + 5  大屏五項資料
  Future<void> inserLog(
      int id,
      String deviceId,
      String in_out,
      int faceId,
      String faceTypeId,
      String time,
      String OKorNOT,
      int? IN_TOTAL,
      int? IN_DEDUPLICATE,
      int? OUT_TOTAL,
      int? OUT_DEDUPLICATE,
      int bigIN,
      int bigDeIN,
      int bigOUT,
      int bigDeOUT,
      int Remain
      ) async {
    // Insert some records in a transaction
    await _database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO $table (cid, deviceId,	in_out,	faceId,	'
              'FaceTypeId,	time,	OK,	'
              'IN_TOTAL, IN_DEDUPLICATE, OUT_TOTAL, OUT_DEDUPLICATE, '
              'BigIN, BigDeIN, BigOUT, BigDeOUT, Remain) VALUES($id, $deviceId, "$in_out", $faceId, $faceTypeId, "$time", "$OKorNOT",'
              '$IN_TOTAL, $IN_DEDUPLICATE, $OUT_TOTAL, $OUT_DEDUPLICATE, $bigIN, $bigDeIN , $bigOUT, $bigDeOUT,'
              '$Remain)');
      print('art 0604 DB insert $in_out $faceId $OKorNOT: $id1');
    });
  }

  Future<Map?> queryLast(int myFaceId) async {
    // get single row
    // List<String> columnsToSelect = [
    //   DatabaseHelper.columnId,
    //   DatabaseHelper.columnName,
    //   DatabaseHelper.columnAge,
    // ];
    String whereString = 'faceId = ?';
    List<dynamic> whereArguments = [myFaceId];
    List<Map>? result = (await _database?.query(
        table,
        where: whereString,
        whereArgs: whereArguments))?.cast<Map>();

    //print('art 0604 queryLast: $result');
    if(result==null || result.isEmpty) return null;
    // print the results
    Map? map = result.last;
    //print('art 0604 queryLast last exist: $map');
    // {_id: 1, name: Bob, age: 23}

    return map;
  }

  Future<bool> isDataExist(int cid) async {
    if(cid==0) return false;
    String whereString = 'cid = ?';
    List<dynamic> whereArguments = [cid];
    List<Map>? result = (await _database?.query(
        table,
        where: whereString,
        whereArgs: whereArguments))?.cast<Map>();

    //print('art 0604 queryLast: $result');
    if(result==null || result.isEmpty) return false;
    print('art 0612 isDataExist last exist: $result');

    return true;
  }

  Future<int?> updateRecord(int id, String okNotOK) async {
    //UPDATE table set col = 1 WHERE id = (SELECT MAX(id) FROM table)
    // raw query
    return await _database?.rawUpdate("UPDATE $table set OK = '$okNotOK' WHERE id = $id");
  }

  clearData() async {
    return await _database?.rawDelete("DELETE FROM $table");
  }
}