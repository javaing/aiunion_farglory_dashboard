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
    return getEnterProfile();
  }

  double width720p = 250;
  double width1080p = 340;
  double avatarSize720p = 60;
  double avatarSize1080p = 100;
  double font720p = 15;
  double font1080p = 28;


  Widget getEnterProfile() {

    Widget w = Row(
      children: [
        getAvatar(),
        getCheckList()
      ], );

    // Widget p = Padding(
    //   padding: EdgeInsets.only(top: 10.0, left: 10.0),
    //   child: w);

    return Container(
      width: width1080p,
      padding: const EdgeInsets.fromLTRB(10,20, 0,0),
      child: w,
    );
  }

  Widget getAvatar() {
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
    Widget check;
    if(profile.boolList==null) {
      check = getCheckInit();
    } else {
      check = getCheckResult(profile.boolList!);
    }

    return Column(children: [
      enterOrLeaveTag(),
      const SizedBox(height: 10,),
      check,
    ]
    );
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


  // ImageProvider getImage(String path) {
  //   if(path.contains("/")) {
  //     return NetworkImage(path);
  //   } else {
  //     return Image.asset('images/$path').image;
  //   }
  // }

  Widget avatarW() {
    return Column(
      children: [
        CircleAvatar(
          radius: avatarSize1080p,
          backgroundImage: getImage(profile.imageUrl),
        ),
        SizedBox(height: 4,),
        whiteText( "姓名:${profile.name}", font1080p),
        whiteText("單位:${profile.profession}", font1080p),
      ],
    );
  }

  Widget getCheckInit() {
    //print("art 0420 CheckResult [boolList]=" + boolList.toString());
    return Column(children: [
      //酒精
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[0] ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[0]), 30)],),
      const SizedBox(height: 5,),
      //工地帽
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[1] ,30), const SizedBox(width: 10,) ,  const SizedBox(width: 30,)],),
      const SizedBox(height: 5,),
      //背心
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[2] ,30), const SizedBox(width: 10,) ,  const SizedBox(width: 30,)],),
    ],);

  }


  Widget getCheckResult(List<bool> boolList) {
    //print("art 0420 CheckResult [boolList]=" + boolList.toString());
    return Column(children: [
      //酒精
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[0] ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[0]), 30)],),
      const SizedBox(height: 5,),
      //工地帽
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[1] ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[1]), 30)],),
      const SizedBox(height: 5,),
      //背心
      Row(children: [const SizedBox(width: 20,) , getAssetImageSize(checkImages[2] ,30), const SizedBox(width: 10,) ,  getAssetImageSize(getOKIConName(boolList[2]), 30)],),
    ],);

  }

}


class ClearUpProfile extends StatelessWidget {
  final Profile profile;

  ClearUpProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return getClearUpProfile();
  }

  Widget getClearUpProfile() {
    return Container(
      width: 210,
      padding: const EdgeInsets.fromLTRB(0,10, 0,0),
      child: avatarClearUp(),
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


}

ImageProvider getImage(String path) {
  if(path.contains("/")) {
    return NetworkImage(path);
  } else {
    return Image.asset('images/$path').image;
  }
}

Widget whiteText(String txt, double size) {
  return Center(child: Text(txt,
    style: TextStyle(
      fontSize: size,
      color: Colors.white,
    ),));
}