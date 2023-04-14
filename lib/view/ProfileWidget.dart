import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';
import '../datamodel/Profile.dart';
import '../util/Utils.dart';
import '../viewmodel/TableScreenViewModel.dart';

class ProfileWidget extends StatelessWidget {
  final Profile profile;

  List<String> checkImages = ['check1.png', 'check2.png', 'check3.png'];
  List<String> resultImages = ['ic_confirm.png', 'ic_refuse.png'];

  String getOKIConName(bool isOK) {
    if(isOK) return resultImages[0];
    return resultImages[1];
  }

  ProfileWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    if(currentMode == DisplayMode.clearup) {
      return getClearUpProfile();
    }
    return getEnterProfile();
  }

  Widget getEnterProfile() {
    return Container(
      width: 250,
      padding: const EdgeInsets.fromLTRB(0,10, 0,0),
      child: Row(children: [
        getAvatar(),
        getCheckList()
      ], ),
    );
  }

  Widget getClearUpProfile() {
    return Container(
      width: 210,
      padding: const EdgeInsets.fromLTRB(0,10, 0,0),
      child: getAvatar(),
    );
  }

  Widget getAvatar() {
    if(currentMode == DisplayMode.clearup) {
      return avatarClearUp();
    }
    if(profile.action==leaveStr) {
      return avatarW();
    } else {
      // red or green check icon
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          avatarW(),
          // Positioned(
          //     bottom: 50,
          //     right: -5,
          //     child: getAssetImageSize(getOKIConName(profile.boolList[3]), 40)
          // ),

        ],);
    }
  }

  Widget getCheckList() {

    if(profile.action==leaveStr) {

      return Column(children: [
        enterOrLeaveTag(),
        const SizedBox(height: 10,),
        getCheckResult(profile.boolList),
      ]);

    } else {
      return Column(children: [
        enterOrLeaveTag(),
        const SizedBox(height: 10,),
        getCheckResult(profile.boolList),
      ]
      );
    }

  }

  Widget enterOrLeaveTag() {
    Color tagColor = enterCountColor;
    if(profile.action==leaveStr) {
      tagColor = leaveCountColor;
    }
    return Center(child: Container(
        width: 60,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: tagColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: whiteText(profile.action,16)
    ));
  }


  ImageProvider getImage(String path) {
    if(path.contains("/")) {
      return NetworkImage(path);
    } else {
      return Image.asset('images/$path').image;
    }
  }

  Widget avatarW() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: getImage(profile.imageUrl),
        ),
        SizedBox(height: 4,),
        whiteText( "姓名:${profile.name}", 15),
        whiteText("單位:${profile.profession}", 15),
      ],
    );
  }

  Widget avatarClearUp() {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: getImage(profile.imageUrl),
        ),
        SizedBox(height: 4,),
        whiteText( "姓名:${profile.name}", 20),
        whiteText("單位:${profile.profession}", 20),
      ],
    );
  }

  Widget getCheckResult(List<bool> boolList) {

    return Column(children: [
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize('check1.png' ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[0]), 30)],),
      const SizedBox(height: 5,),
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize('check2.png' ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[1]), 30)],),
      const SizedBox(height: 5,),
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize('check3.png' ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[2]), 30)],),
    ],);

  }


}

Widget whiteText(String txt, double size) {
  return Center(child: Text(txt,
    style: TextStyle(
      fontSize: size,
      color: Colors.white,
    ),));
}