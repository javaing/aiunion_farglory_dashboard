//for DashBoard
import '../util/Utils.dart';

class Profile {
  //final String? faceId;
  final int faceId;
  final String name;
  late String profession;
  late String imageUrl;
  late String action;
  List<bool>? boolList;
  int end_time;
  int typeId;
  bool isOK;

  Profile({required this.faceId, required this.name, required this.profession, required this.imageUrl, required this.action, required this.boolList, required this.end_time, required this.typeId, required this.isOK});

  Map toJson() => {
    'faceId': faceId,
    'name': name,
    'profession': profession,
    'imageUrl': imageUrl,
    'action': action,
    'boolList': boolList,
    'end_time': end_time,
    'typeId' : typeId,
    'isOK' : isOK,
  };

  factory Profile.fromJson(dynamic json) {
    List<bool> lb = dynamicToListBool(json['boolList']);
    return Profile(faceId: json['faceId'] as int, name: json['name'] as String, profession:json['profession'] as String, imageUrl:json['imageUrl'] as String, action:json['action'] as String, boolList:lb, end_time:json['end_time'] as int, typeId:json['typeId'] ?? -1, isOK:json['enable'] ?? true);
  }

}

class Vendor {
  late int faceTypeId;
  late String name;
  List<int> worker = [];

  Vendor({required this.faceTypeId, required this.name, required this.worker});

  Map toJson() => {
    'faceTypeId': faceTypeId,
    'name': name,
    'worker': worker,
  };

  factory Vendor.fromJson(dynamic json) {
    List<int> ls = dynamicToListInt(json['worker']);
    return Vendor(faceTypeId: json['faceTypeId'] as int, name: json['name'] as String, worker:ls);
  }


  //vendorFaceTypeId[i] =

}