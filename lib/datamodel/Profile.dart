//for DashBoard
class Profile {
  //final String? faceId;
  final int faceId;
  final String name;
  late String profession;
  late String imageUrl;
  late String action;
  List<bool>? boolList;
  int end_time;

  Profile({required this.faceId, required this.name, required this.profession, required this.imageUrl, required this.action, required this.boolList, required this.end_time});

  Map toJson() => {
    'faceId': faceId,
    'name': name,
    'profession': profession,
    'imageUrl': imageUrl,
    'action': action,
    'boolList': boolList,
    'end_time': end_time,
  };

  factory Profile.fromJson(dynamic json) {
    List<bool> lb = [];
    List<dynamic> dd = json['boolList'];
    for(int i=0;i<dd.length; i++) {
      lb.add(dd[i] as bool);
    }
    return Profile(faceId: json['faceId'] as int, name: json['name'] as String, profession:json['profession'] as String, imageUrl:json['imageUrl'] as String, action:json['action'] as String, boolList:lb, end_time:json['end_time'] as int);
  }

}