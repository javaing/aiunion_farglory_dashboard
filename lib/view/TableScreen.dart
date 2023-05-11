import 'dart:async';
import 'dart:convert';

import 'package:far_glory_construction_gashboard/util/UIUtil.dart';
import 'package:far_glory_construction_gashboard/view/Setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import '../datamodel/Profile.dart';
import '../datamodel/WebSocketFace.dart';
import '../util/MarqueeWidget.dart';
import '../util/Utils.dart';
import '../viewmodel/TableScreenViewModel.dart';
import 'EnviromentTable.dart';
import 'ProfileWidget.dart';
import 'TableScreenVideo.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

const int VENDOR_COLUMN_LIMIT = 4;
const double VENDOR_NAME_WIDTH = 150.0;
const double VENDOR_MANPOWER_WIDTH = 80.0;
const double Top2_TEXT_SIZE = 40.0;
const double Top2_NUMBER_SIZE = 60.0;

class _TableScreenState extends State<TableScreen> {
  late String _timeString;
  late Timer _timerSecond;
  late Timer _timerMinute;
  late String aa = headerNews;
  String clearTime = "";
  String resetTime = "";


  @override
  void initState() {
    super.initState();
    loadPref();

    _timeString = formatDateTime(DateTime.now());
    _timerSecond =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    _timerMinute =
        Timer.periodic(const Duration(minutes: 1), (Timer t) => _getMinutes());

    // TableScreenViewModel viewModel = TableScreenViewModel();
    //
    // var filtered1 = profilesPool.where((e) => e.action == leaveStr).toList();
    // leaveCount = filtered1.length;
  }


  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      WS_SERVER = prefs.getString(PREF_KEY_WS_SERVER)!;
      clearTime = prefs.getString(PREF_KEY_CLEARUP_TIME)!;
      resetTime = prefs.getString(PREF_KEY_RESET_TIME)!;
      //clearTime = "11:50";
      //resetTime = "12:50";
      //print("art 0511 loadPref OK WS_SERVER="+ WS_SERVER);
      viewModel = TableScreenViewModel(context);
    });

  }

  //int profileCount = 0;
  void _getTime() {
    //in setState() UI才會更新
    setState(() {
      _timeString = getformatNow();
    });

    profiles.clear();
    profiles.addAll(profilesPool);
    if(profiles.length > LIMIT_LIST_PROFILE) {
      profiles.removeRange(0, profiles.length-LIMIT_LIST_PROFILE);
    }
  }

  void _getMinutes() {
    setState(() {
      String hhmm = getHHMM();
      print("art hhmm=$hhmm clearTime=$clearTime resetTime=$resetTime");
      if(hhmm == clearTime) {
        currentMode = DisplayMode.clearup;
      } else if(hhmm == resetTime){
        currentMode = DisplayMode.punch;
        for (int i = 0; i <vendorTitle2.length ; i++) {
          vendorTitle2[i]=DEFAULT_VENDOR_NAME;
        }
        for (int i = 0; i <vendorCount2.length ; i++) {
          vendorCount2[i] = 0;
        }
        profilesPool.clear();
        leaveCount = 0;
      }
    });
  }

  @override
  void deactivate() {
    print("art 0509 deactivate()");
    super.deactivate();
    viewModel.deactivate();
    _timerSecond.cancel();
    _timerMinute.cancel();
  }

  late double heightRowTop;
  late double heightRowBody;
  late double heightRowBottom;
  late double widthThirdOne;
  late double myWidth;
  int demoType = 0;
  late TableScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    var filtered1 = profilesPool.where((e) => e.action == leaveStr).toList();
    leaveCount = filtered1.length;

    heightRowTop = MediaQuery.of(context).size.height * 0.1;
    heightRowBody = MediaQuery.of(context).size.height * 0.33;
    heightRowBottom = MediaQuery.of(context).size.height * 0.36;
    myWidth = MediaQuery.of(context).size.width;



    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30,0,30,0),
        decoration: BoxDecoration(
          border: Border.all(width: BORER_WIDTH, color: borderColor),
        ),
        child: getCombination(context, currentMode),
      ),
    );

  }




  Widget getCombination(BuildContext context, DisplayMode mode) {

    Widget wig;
    switch(mode) {
      case DisplayMode.punch:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
            getRowBody(context),
            getRowBottom(),
          ],
        );
        break;

      case DisplayMode.clearup:
        wig = Column(
          children: [
            //getRowTop(context, heightRowTop),
            getClearModeBody(context),
            getRowBottom(),
          ],
        );
        break;
    }

    return wig;
  }

  Widget getBigNumberRow() {
    List<Color> fieldColors = [enterCountColor , leaveCountColor,resideCountColor];
    var sum = vendorCount2.reduce((value, element) => value + element);
    List<int> leftRow1Count = [ sum.toInt(), leaveCount, (sum-leaveCount).toInt()];

    return Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRowWithColor(leftRow1Title, fieldColors, heightRowBody*0.2, Top2_TEXT_SIZE),
          genTableRowWithColor(toStringList(leftRow1Count), fieldColors, heightRowBody*0.42, Top2_NUMBER_SIZE )
        ]
    );

  }

  Widget getClearuTitle() {
    List<Color> fieldColors = [enterCountColor , leaveCountColor, resideCountColor];
    var sum = vendorCount2.reduce((value, element) => value + element);
    leaveCount = sum.toInt() - profilesRemain.length;
    List<int> leftRow1Count = [ sum.toInt(), leaveCount,  profilesRemain.length];

    Widget title =  Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRowWithColor(clearupTitle, fieldColors, heightRowBody*0.2, Top2_TEXT_SIZE),
          genTableRowWithColor(toStringList(leftRow1Count), fieldColors, heightRowBody*0.42, Top2_NUMBER_SIZE )
        ]
    );

    String str2 = formatTimeDashBoard(DateTime.now());
    double hh = heightRowBody*(0.2+0.42) ;
    Widget timeText = Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: resideCountColor,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: hh,
          child: Center(
            child: colorText(str2, 35, Colors.white),
          ),
        ),

      ),
    );


    return Row(children: [
      Expanded(flex: 3, child: title),
      Expanded(flex: 1, child: timeText),
    ],);

  }

  Widget getClearModeBody(BuildContext context) {
    Widget w = Column(
      children: [
        getClearuTitle(),
        const SizedBox(height: 10,),
        getClearUpAvatar()
      ],
    );

    // return GestureDetector(
    //   onTap: () {
    //     currentMode = DisplayMode.punch;
    //   },
    //   child: w,
    // );

    return w;
  }

  Widget getMiddleLeft(double h) {
    double rowHeight = heightRowBody / 5;

    List<List<String>> dataList = List.generate(4, (index) =>
    [vendorTitle2[index], vendorCount2[index].toInt().toString(), vendorTitle2[index+4], vendorCount2[index+4].toInt().toString(),]
    ) ;
    Widget tab = EnviromentTable(height: rowHeight, data: dataList, fontSize: 36,);

    return normalBorderLeftBottom( Container(color: normalBackground,
        height: h,
        child: Column(
          children: [
            getBigNumberRow(),
            const SizedBox(height: 10,),
            tab
          ],
        )));
  }

  Widget getRowBody(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.52;
    //double h = heightRowBody;

    //左右
    return SizedBox(
      height: h,
      child: Row(children: [
        Expanded(flex: 2, child: getMiddleLeft(h)),
        Expanded(flex: 1, child: getMiddleRight(context, h)),
      ]),
    );

  }


  //環境檢測
  Widget getMiddleRight(BuildContext context, double h) {
    List<List<String>> dataList = List.generate(environTitle.length, (index) =>
    //[environTitle[index], environCount[index]]) ;
    [environTitle[index], environCount[index], environColor[index]]) ;
    double hh = 40*1.8;

    Widget w = normalBorder(
    Container(color: normalBackground,
        height: h,
        padding: const EdgeInsets.only(left:20, bottom: 0, right: 0, top:0),
        child: Column(
      children: [
        textSetHeightBold2('環境資訊', 55, 200),
        EnviromentTable(height: hh, data: dataList, fontSize: 32,),
      ],
    )
    ));

    return GestureDetector(
      onTap: () {
        currentMode = DisplayMode.clearup;
      },
      child: w,
    );


  }


  Widget textByCustom(double wid, double hh, Color c, String str, double size ) {
    return Container(
      width: wid,
      height: hh,
      color: c,
      child: Center(child:
      Text(str, style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),),
      ),
    );
  }

  Widget getRowBottom() {
    //print("art 0414 getRowBottom() size=${profiles.length}");

    Widget profileListView = ListView.builder(
      //shrinkWrap: true, //just set this property
      scrollDirection: Axis.horizontal,
      itemCount: profiles.length,
      itemBuilder: (BuildContext context, int index) {
        Profile pp = profiles[index];
        return ProfileWidget(profile: pp);
      },
    );

    Widget p = Padding(
        padding: EdgeInsets.only(top: 24.0, left: 15.0),
        child: profileListView
    );

    // Widget w = Padding(
    //     padding: const EdgeInsets.only(top: 10.0, left: 10.0),
    //     child: profileListView);

        return normalBorderLeftBottomRight(
            addTextBackGround(
                SizedBox(
                  height: heightRowBottom,
                  child: p,
                )
            )
    );
  }

  Widget getClearUpAvatar() {
    Widget w = ListView.builder(
      //shrinkWrap: true, //just set this property
      scrollDirection: Axis.horizontal,
      itemCount: profilesRemain.length,
      itemBuilder: (BuildContext context, int index) {
        Profile pp = profilesRemain[index];
        return ClearUpProfile(profile: pp);
      },
    );

    return normalBorderLeftBottomRight(
        addTextBackGround(
          SizedBox(
            height: heightRowBottom,
            child: w,
          )
        )
    );
  }

  Widget normalBorder(Widget w) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: BORER_WIDTH,),
      ),
      child: w,
    );
  }

  // Widget getRoBottomNew() {
  //   Widget profileListView = ListView.builder(
  //     //shrinkWrap: true, //just set this property
  //     scrollDirection: Axis.horizontal,
  //     itemCount: profiles1.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       Profile profile = profiles1[index];
  //       return ProfileWidget(profile: profile);
  //     },
  //   );
  //
  //   Widget profileListView2 = ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: profiles2.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       Profile pp = profiles2[index];
  //       return ProfileWidget(profile: pp);
  //     },
  //   );
  //
  //   Widget w1 = normalBorderLeftBottom(textByCustom(
  //       60,
  //       heightRowBottom,
  //       resideCountColor,
  //       enterStr,
  //       30
  //   ));
  //
  //   Widget w3 = normalBorderLeftBottom(textByCustom(
  //       60,
  //       heightRowBottom,
  //       leaveCountColor,
  //       leaveStr,
  //       30
  //   ));
  //
  //   Widget w2 = normalBorderLeftBottom(
  //       addTextBackGround(
  //           SizedBox(
  //             height: heightRowBottom,
  //             width: 535,
  //             child: profileListView,
  //           )
  //       )
  //   );
  //
  //   Widget w4 = normalBorderLeftBottomRight(
  //       addTextBackGround(
  //           SizedBox(
  //             height: heightRowBottom,
  //             width: 535,
  //             child: profileListView2,
  //           )
  //       )
  //   );
  //
  //   return  Row(children: [
  //     w1,w2,w3, w4
  //   ],);
  // }

  Widget textSetHeight(String txt, double hh) {
    return SizedBox(
      height: hh,
      child: Align(
        alignment: Alignment.centerRight,
        // Align however you like (i.e .centerRight, centerLeft)
        child: Text(txt),
      ),
    );
  }


  Widget centerTextTop2(String txt, double hh, double size) {
    // if(txt.compareTo('0')==0) {
    //   print("art 0413 bingo! centerTextTop2=$txt");
    //   txt = " ";
    // }

    TextStyle myStyle = const TextStyle(
        fontSize: 35.0,
        color: Colors.white
    );
    if(size== Top2_TEXT_SIZE) {

    } else {
      myStyle = const TextStyle(
          fontSize: 70.0,
          color: Colors.white
      );
    }

    return SizedBox(
      height: hh,
      child: Center(
        child: Text(
          txt,
          style: myStyle,
        ),
      ),
    );

  }



  Widget centerTextSetHeightBold(String txt, double hh) {
    return SizedBox(
      height: hh,
      child: Center(
          child: Text(
            txt,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
    );
  }

  Widget textSetHeightBold2(String txt, double hh, double wid) {
    return SizedBox(
      width: wid,
      height: hh,
      child: Align(
        alignment: Alignment.center,
        // Align however you like (i.e .centerRight, centerLeft)
        child: Padding(
          padding: const EdgeInsets.only(left:0, bottom: 0, right: 0, top:0), //apply padding to some sides only
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ),
    );
  }


  Widget centerTextSetHeightBold2(String txt, double hh, double wid) {
    return SizedBox(
      width: wid,
      height: hh,
      child: Center(
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 20,
              //fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  TableRow genTableRow(List<String> list, double hh) {
    return TableRow(
      children: List.generate(
        list.length,
            (index) => TableCell(
          child: centerTextSetHeightBold(list[index], hh),
        ),
      ),
    );
  }

  TableRow genTableRowWithColor(List<String> list, List<Color> myColors , double hh, double size) {
    return TableRow(
      children: List.generate(
        list.length,
            (index) => TableCell(
          child: DecoratedBox(
            decoration: BoxDecoration(color: myColors[index]),
            child: centerTextTop2(list[index], hh, size),
          ),
        ),
      ),
    );
  }


}




Widget addTextBackGround(Widget w) {
  return Container(
    color: normalBackground,
    child: Align(
      alignment: Alignment.center,
      child:  w,
    ),
  );
}

Widget addTextBackGroundT(Widget w) {
  return Container(
    color: Colors.greenAccent,
    child: Align(
      alignment: Alignment.center,
      child:  w,
    ),
  );
}


Widget normalBorderTopLeft(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: BORER_WIDTH, color: borderColor),
        left: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}

Widget normalBorderTopLeftRight(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: BORER_WIDTH, color: borderColor),
        left: BorderSide(width: BORER_WIDTH, color: borderColor),
        right: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}

Widget normalBorderLeftBottomRight(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(width: BORER_WIDTH, color: borderColor),
        left: BorderSide(width: BORER_WIDTH, color: borderColor),
        bottom: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}

Widget normalBorderLeftBottomRightT(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(width: BORER_WIDTH, color: Colors.yellow),
        left: BorderSide(width: BORER_WIDTH, color: Colors.yellow),
        bottom: BorderSide(width: BORER_WIDTH, color: Colors.yellow),
      ),
    ),
    child: w,
  );
}

Widget normalBorderLeft(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        left: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}

Widget normalBorderRight(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}


Widget normalBorderLeftBottom(Widget w) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        left: BorderSide(width: BORER_WIDTH, color: borderColor),
        bottom: BorderSide(width: BORER_WIDTH, color: borderColor),
      ),
    ),
    child: w,
  );
}

Widget centerTextSetHeight(String txt, double hh) {
  // return Container(
  //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //   color: normalBackground,
  //   child: Align(
  //     alignment: Alignment.bottomCenter,
  //     child: SizedBox(
  //       height: hh,
  //       child: Center(
  //         child: whiteText(txt,22),
  //       ),
  //     ),
  //
  //   ),
  // );
  //return centerTextSetHeightSize(txt, hh, 22); 720p
  return centerTextSetHeightSize(txt, hh, 26); //1080p
}

Widget centerTextSetHeightSize(String txt, double hh, double fontSize) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    color: normalBackground,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: hh,
        child: Center(
          child: whiteText(txt, fontSize),
        ),
      ),

    ),
  );

}


Widget getRowTop(BuildContext ctx, double hh) {
  String str1 = headerNews;
  String str2 = formatDateTimeDashBoard(DateTime.now());

  double myWidth = MediaQuery.of(ctx).size.width;
  double mqueeWidth = myWidth * 0.75;
  double timeWidth = myWidth * 0.1;
  double weatherWidth = myWidth * 0.05;

  Widget w = Row(children: [
    normalBorderTopLeft(
      SizedBox(child: centerTextSetHeight(str2, hh),width: timeWidth)

    ),
    normalBorderTopLeftRight(
        Row(children: [
          centerTextSetHeight(headerWeather, hh),
          Container(
            decoration: BoxDecoration(
              color: normalBackground,
            ),
            child: Image.asset('images/weather1.png', width: weatherWidth, height: hh, ),
          ),

      ],)

    ),
  ],);

 Widget maquee = normalBorderTopLeft(
     addTextBackGround(
         SizedBox(
           width: mqueeWidth,
           height: hh,
           child: MarqueeWidget(
             direction: Axis.horizontal,
             child: whiteText(str1,  54),
           ),
         )
     )
 );



  return
    Row(children: [
      GestureDetector(
        onTap: () {
          //showDialog(context: ctx, builder: (BuildContext context) => setDevicesDialog(context));
          Navigator.push(ctx,
            MaterialPageRoute(builder: (context) =>  Setting()),
          );
        },
        child: maquee,
      ),

      GestureDetector(
        onTap: () {
          Navigator.push(ctx,
            MaterialPageRoute(builder: (context) => const TableScreenVideo()),
          );
        },
        child: w,
      ),


    ]);
}

Dialog setDevicesDialog(BuildContext ctx) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 300.0,
      width: 300.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text('進場裝置', ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('出場裝置', style: TextStyle(color: Colors.red),),
          ),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          TextButton(onPressed: () {
            Navigator.of(ctx).pop();
          },
              child: Text(' OK ', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
        ],
      ),
    ),
  );
}