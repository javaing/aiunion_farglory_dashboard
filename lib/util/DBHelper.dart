import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? database = null;

  DBHelper() {
    openDB();
  }

  Future<void> openDB() async {
    database = await openDatabase('my_db.db');
  }

  Future<List<Map<String, Object?>>>?  getAllData() {
    return database?.query("IN_OUT");
  }


  //deviceId	in_out	faceId	FaceTypeId	time	OK	IN_TOTAL	IN_DEDUPLICATE	OUT_TOTAL	OUT_DEDUPLICATE + 5  大屏五項資料
  Future<void> inserLog(String deviceId,
      String in_out,
      String faceId,
      String faceTypeId,
      String time,
      String OK,
      int? IN_TOTAL,
      int? IN_DEDUPLICATE,
      int? OUT_TOTAL,
      int? OUT_DEDUPLICATE,
      String bigIN,
      String bigDeIN,
      String bigOUT,
      String bigDeOUT,
      String Remain
      ) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO IN_OUT(deviceId,	in_out,	faceId,	'
              'FaceTypeId,	time,	OK,	'
              'IN_TOTAL,	IN_DEDUPLICATE,	OUT_TOTAL, OUT_DEDUPLICATE, '
              'BigIN, BigDeIN, BigOUT, BigDeOUT, Remain) VALUES($deviceId, $in_out, $faceId, $faceTypeId, $time, $OK,'
              '$IN_TOTAL, $IN_DEDUPLICATE, $OUT_TOTAL, $OUT_DEDUPLICATE, $bigIN, $bigDeIN , $bigOUT, $bigDeOUT,'
              '$Remain)');
      print('inserted1: $id1');
    });
  }

}