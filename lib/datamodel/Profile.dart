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
}