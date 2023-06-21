import '../datamodel/WebSocketFace.dart';
import '../viewmodel/TableScreenViewModel.dart';
import 'DBHelper.dart';
import 'Utils.dart';

Future<void> dbLogIn(String deviceId, WebSocketFace face) async {
  Map? map = await deHelper.queryLast(face.face_id!);

  if(map==null || map.isEmpty) {
    await addNewIN(deviceId, face, DBHelper.ok);
  } else {
    if(map["in_out"]==DBHelper.IN) {
      await addNewIN(deviceId, face, DBHelper.x);
    } else {
      //int? result = await deHelper.updateRecord(map["id"], DBHelper.ok);
      //print('art 0604 update record ${map["faceId"]}' );
      await addNewIN(deviceId, face, DBHelper.ok);
    }
  }

}

Future<void> addNewIN(String deviceId, WebSocketFace face, String okOrNot) async {
  var time = unixtimeFormat( face.start_time!);
  int? isAdd = 1;
  if(okOrNot == DBHelper.x) isAdd = 0;
  var unique = enterFaceId.contains(face.face_id)? 0:1;


  await deHelper.inserLog(face.getCID() , deviceId, DBHelper.IN , face.face_id!, face.type_id! , time, okOrNot ,
      isAdd, unique, 0, 0, enterCount, enterFaceId.length,
      leaveCount, leaveFaceId.length, blockCount);
}



Future<void> addNewOUT(String deviceId, WebSocketFace face, String okOrNot) async {
  var time = unixtimeFormat( face.start_time!);
  int? isLeave = 1;
  if(okOrNot == DBHelper.x) isLeave = 0;
  var unique = leaveFaceId.contains(face.face_id)? 0:1;

  await deHelper.inserLog(face.getCID() , deviceId, DBHelper.OUT , face.face_id!, face.type_id! , time, okOrNot ,
      0, 0, isLeave, unique, enterCount, enterFaceId.length,
      leaveCount, leaveFaceId.length, blockCount);
}

Future<void> dbLogOut(String deviceId, WebSocketFace face) async {
  Map? map = await deHelper.queryLast(face.face_id!);

  if(map==null || map.isEmpty) {
    await addNewOUT(deviceId, face, DBHelper.x);
  } else {
    if(map["in_out"]==DBHelper.OUT) { //same inout, add a record
      await addNewOUT(deviceId, face, DBHelper.x);
    } else {
      //int? result = await deHelper.updateRecord(map["id"], DBHelper.ok);
      //print('art 0604 update ${map["id"]} ok:${result ?? ""}' );
      await addNewOUT(deviceId, face, DBHelper.ok);
    }
  }
}
