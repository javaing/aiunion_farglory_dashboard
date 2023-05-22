//for DashBoard
class Profile {
  //final String? faceId;
  final int faceId;
  final String name;
  late String profession;
  late String imageUrl;
  late String action;
  List<bool>? boolList;

  Profile({required this.faceId, required this.name, required this.profession, required this.imageUrl, required this.action, required this.boolList});

  Map toJson() => {
    'faceId': faceId,
    'name': name,
    'profession': profession,
    'imageUrl': imageUrl,
    'action': action,
    'boolList': boolList,
  };

  factory Profile.fromJson(dynamic json) {
    List<bool> lb = [];
    List<dynamic> dd = json['boolList'];
    for(int i=0;i<dd.length; i++) {
      lb.add(dd[i] as bool);
    }
    return Profile(faceId: json['faceId'] as int, name: json['name'] as String, profession:json['profession'] as String, imageUrl:json['imageUrl'] as String, action:json['action'] as String, boolList:lb);
  }

}