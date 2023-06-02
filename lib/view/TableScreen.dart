import 'dart:async';
import 'dart:convert';
import 'dart:collection';

import 'package:far_glory_construction_dashboard/datamodel/AirCondition.dart';
import 'package:far_glory_construction_dashboard/util/UIUtil.dart';
import 'package:far_glory_construction_dashboard/view/Setting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../Constants.dart';
import '../datamodel/Profile.dart';
import '../datamodel/ServerFaceType.dart';
import '../datamodel/Weather36Hr.dart';
import '../datamodel/WebSocketFace.dart';
import '../util/MarqueeWidget.dart';
import '../util/Utils.dart';
import '../viewmodel/TableScreenViewModel.dart';
import 'EnviromentTable.dart';
import 'ProfileWidget.dart';
import 'TableScreenVideo.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

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
  late Timer _timerHours;
  late String aa = headerNews;
  late Widget _pic;
  String town = "桃園區";

  late double heightRowTop;
  late double heightRowBody;
  late double heightRowBottom;
  late double widthThirdOne;
  late double myWidth;
  int demoType = 0;
  late TableScreenViewModel viewModel;

  List<dynamic>? data;
  //var data = new List(Map<String, String>);
  String weatherText = "";
  String WxString="", ATString = "";


  @override
  void initState() {

    _pic = Image.asset('images/weather1.png', width:100, height:100);
    super.initState();
    loadPref();
    loadFaceType(dio);
    loadWeatherPicData();
    askWeather(town);
    loadAirReport();
    loadTodayProfile();
    

    _timeString = formatDateTime(DateTime.now());
    _timerSecond =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    _timerMinute =
        Timer.periodic(const Duration(minutes: 1), (Timer t) => _getMinutes());
    _timerHours = Timer.periodic(const Duration(hours: 1), (Timer t) => _everHours());

    //checkPermission();
  }

  // Future<void> checkPermission() async {
  //   var status = await Permission.storage.status;
  //   if (status.isDenied) {
  //     showMsg(context, '請開啟寫檔權限');
  //     openAppSettings();
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    heightRowTop = MediaQuery.of(context).size.height * 0.1;
    heightRowBody = MediaQuery.of(context).size.height * 0.33;
    heightRowBottom = MediaQuery.of(context).size.height * 0.368;
    myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        decoration: BoxDecoration(
          border: Border.all(width: BORER_WIDTH, color: borderColor),
        ),
        child: getCombination(context, currentMode),
      ),
    );

  }

  @override
  void deactivate() {
    print("art 0509 deactivate()");
    super.deactivate();
    viewModel.deactivate();
    _timerSecond.cancel();
    _timerMinute.cancel();
    _timerHours.cancel();
  }

  String environUpdateTime = "";
  void loadAirReport() async {
    var url = "https://data.epa.gov.tw/api/v2/aqx_p_432?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&limit=1000&sort=ImportDate%20desc&format=JSON";
    var response = await dio.get(url);
    setState(() {
      var str = response.toString().replaceAll("pm2.5", "pm25");
      AirCondition airCondition = airConditionFromJson(str);
      //print(airCondition);
      var find = airCondition.records?.where((element) => element.sitename=="桃園");
      //print(find);
      if(find!.isNotEmpty) {
        //print("${find.first.aqi!} ${find.first.wind_speed!}");
        environCount[0] = find.first.aqi!;
        environCount[1] = find.first.pollutant!;
        environCount[2] = find.first.status!;
        environCount[3] = "${find.first.co!} (ppm)";
        environCount[4] = "${find.first.pm10!} (μg/m3)";
        environCount[5] = "${find.first.pm25!} (μg/m3)";
        environCount[6] = "${find.first.wind_speed!} (m/sec)";

        if(environCount[2]=="普通") {
          environColor[2] = "yellow";
        }
        // if(environCount[2]=="良好") {
        //   environCount[2]="Good";
        // }
        environUpdateTime = find.first.publishtime ?? "";
        environUpdateTime = "${environUpdateTime.replaceAll(":00:00", ":00")} $UPDATE";
      }
      /*
      aqi(空氣品質指標)、
pollutant(空氣污染指標物)、
status(狀態)、
co(一氧化碳(ppm))、
pm10(懸浮微粒(μg/m3))、
pm2.5(細懸浮微粒(μg/m3))、
wind_speed(風速(m/sec))、
       */
    });


  }

  Future<void> loadFaceLib() async {
    loadFaceType(dio);
    print('art 0526 facelib aa=' + faceTypes.toString());
  }

  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if(prefs==null) {
        print("art 0511 loadPref not ready");
        return;
      }
      HOST = prefs.getString(PREF_KEY_WS_SERVER) ?? DEFAULT_WS_SERVER;
      mClearTime = prefs.getString(PREF_KEY_CLEARUP_TIME) ?? DEFAULT_CLEARUP_TIME;
      mResetTime = prefs.getString(PREF_KEY_RESET_TIME) ?? DEFAULT_RESET_TIME;
      AIHost = prefs.getString(PREF_KEY_AI_SERVER) ?? DEFAULT_AI_SERVER;
      mDeduplicate = prefs.getString(PREF_KEY_DEDUPLICATE_SECOND) ?? DEFAULT_AI_SERVER;
      //clearTime = "11:50";
      //resetTime = "12:50";
      //print("art 0511 loadPref OK WS_SERVER="+ WS_SERVER);

      viewModel = TableScreenViewModel(context);
    });

  }

  Future<void> loadFaceType(Dio dio) async {
    var response = await dioV2Get(dio, "/api/v2/face-types?pageSize=1000");
    //print('art find face ' + response.toString() );
    ServerFaceType setting = serverFaceTypeFromJson(response.toString()) ;
    //print('art find face setting= ' + setting.result!.toString());
    if(setting!=null) {
      faceTypes = setting.result!;
      print('art find face faceTypes.length= ' + faceTypes.length.toString() );
    }
  }

  void loadTodayProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //playMP3('blacklist.mp3');

    setState(() {
      if(prefs==null) {
        print("art 0511 loadPref not ready");
        return;
      }
      enterCount = prefs.getInt(PREF_KEY_ENTER_COUNT) ?? 0;
      leaveCount = prefs.getInt(PREF_KEY_LEAVE_COUNT) ?? 0;
      String jsonStr = prefs.getString(PREF_KEY_PROFILE_POOL) ?? "";

      profilesPool.clear();
      profilesRemain.clear();
      if(jsonStr!=null && jsonStr.isNotEmpty) {
        List<dynamic> dd = jsonDecode(jsonStr);
        for(int i=0; i<dd.length; i++) {
          profilesPool.add(Profile.fromJson(dd[i]));
        }
      }

      jsonStr = prefs.getString(PREF_KEY_PROFILE_REMAIN) ?? "";
      if(jsonStr!=null && jsonStr.isNotEmpty) {
        List<dynamic> dd = jsonDecode(jsonStr);
        for(int i=0; i<dd.length; i++) {
          profilesRemain.add(Profile.fromJson(dd[i]));
        }
      }


      jsonStr = prefs.getString(PREF_KEY_VENDOR) ?? "";
      if(jsonStr!=null && jsonStr.isNotEmpty) {
        List<dynamic> dd = jsonDecode(jsonStr);
        for(int i=0; i<dd.length; i++) {
          vendorList.add(Vendor.fromJson(dd[i]));
        }
      }

      jsonStr = prefs.getString(PREF_KEY_ENTER_UNIQUE_FACEID) ?? "";
      if(jsonStr!=null && jsonStr.isNotEmpty) {
        enterFaceId = dynamicToListInt( jsonDecode(jsonStr) );
        //print("art 0511 load enterName=$enterName");
      }

      jsonStr = prefs.getString(PREF_KEY_LEAVE_UNIQUE_FACEID) ?? "";
      if(jsonStr!=null && jsonStr.isNotEmpty) {
        leaveFaceId = dynamicToListInt( jsonDecode(jsonStr) );
        //print("art 0511 load leaveName=$leaveName");
      }

      //_speak();
    });

    // for(int i=0; i<profilesRemain.length; i++) {
    //   print('art 0524 Remain ' +profilesRemain[i].name + " " + profilesRemain[i].typeId.toString());
    // }
  }

  void resetToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if(prefs==null) {
        print("art 0511 loadPref not ready");
        return;
      }
      prefs.setInt(PREF_KEY_ENTER_COUNT, 0) ;
      prefs.setInt(PREF_KEY_LEAVE_COUNT,0) ;
      prefs.setString(PREF_KEY_PROFILE_POOL, "");
      prefs.setString(PREF_KEY_PROFILE_REMAIN, "");
      prefs.setString(PREF_KEY_ENTER_UNIQUE_FACEID , "");
      prefs.setString(PREF_KEY_LEAVE_UNIQUE_FACEID , "");
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
      print("art hhmm=$hhmm clearTime=$mClearTime resetTime=$mResetTime");
      if(hhmm == mClearTime) { //清場
        currentMode = DisplayMode.clearup;
      } else if(hhmm == mResetTime){ //歸零
        askWeather(town);
        resetToday();
        resetData();
      }
    });
  }

  void _everHours() {
    setState(() {
      print("art _everHours askWeather");
      askWeather(town);
      loadAirReport();
      loadFaceLib();
    });
  }

  Future<String> loadWeatherPicData() async {
    var jsonText = await rootBundle.loadString('assets/weather.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }


  Future<void> askWeather(String town) async {
    final response = await dio.get(Weather_URL.replaceFirst("%town", town));

    Weather36Hr weather = weather36HrFromJson(response.toString()) ;
    //int length = weather.records?.locations?.length ?? 0;
    //print('art 0511 weather=$length');

    List<LocationLocation>? aa = weather.records?.locations?[0].location;
    if(aa!=null) {
      //print('art 0511 LocationLocation len =${aa.length}' );
      List<WeatherElement>? ww = aa.first.weatherElement;
      //length = ww?.length ?? 0;
      //print('art 0511 WeatherElement len=$length');

      //Wx
      var Wx = ww?[0];
      if((Wx?.time?.length ?? 0) > 0) {
        var ev = Wx?.time?[0].elementValue![0];
        WxString = ev?.value ?? "";
        //print('art 0511  wx=' + value );
      }
      var TA = ww?[1];
      if((TA?.time?.length ?? 0) > 0) {
        var ev = TA?.time?[0].elementValue![0];
        ATString = ev?.value ?? "";
        //print('art 0511  AT =' + value );
      }
    }

    // if(WxString.contains("雨")) {
    //   WxString = "Short shower";
    // }

    weatherText = "$WxString\n$ATString°C";
    setState(() {
      if(data!=null) {
        var ll = data!.where((element) => element["description"]== WxString);
        if(ll.isNotEmpty) {
          var element = ll.first;
          //print("art 0511 data[]=" +element["description"] + ", " + element["day"]);
          _pic = loadUrlImage(element["day"],90);
        }
      }
    });
  }


  Widget getCombination(BuildContext context, DisplayMode mode) {

    Widget wig;
    switch(mode) {
      case DisplayMode.punch:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop, weatherText, _pic),
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
    //var sum = vendorCount2.reduce((value, element) => value + element);
    //List<int> leftRow1Count = [ sum.toInt(), leaveCount, (sum-leaveCount).toInt()];
    //List<int> leftRow1Count = [ enterCount, leaveCount, profilesRemain.length];
    // int sum =0;
    // for(int j=0; j<vendorList.length; j++) {
    //   sum += vendorList[j].worker.length;
    // }
    //for Peter
    //List<String> leftRow1Count = [ enterCount.toString(), leaveCount.toString(),  profilesRemain.length.toString()];


    int remainNum = profilesRemain.where((element) => element.typeId>0).length;
    List<String> leftRow1CountNew = [ "$enterCount (${enterFaceId.length})", "$leaveCount (${leaveFaceId.length})",  remainNum.toString() ];

    return Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRowWithColor(leftRow1Title, fieldColors, heightRowBody*0.2, Top2_TEXT_SIZE),
          genTableRowWithColor(leftRow1CountNew, fieldColors, heightRowBody*0.42, Top2_NUMBER_SIZE )
        ]
    );

  }

  Widget getClearuTitle() {
    List<Color> fieldColors = [enterCountColor , leaveCountColor, resideCountColor];
    //var sum = vendorCount2.reduce((value, element) => value + element);
    int sum =0;
    for(int j=0; j<vendorList.length; j++) {
      sum += vendorList[j].worker.length;
    }
    //leaveCount = sum.toInt() - profilesRemain.length;
    //List<int> leftRow1Count = [ sum, leaveCount,  profilesRemain.length];
    List<String> leftRow1CountNew = [ "$sum/${enterFaceId.length}", "$leaveCount/${leaveFaceId.length}",  profilesRemain.length.toString() ];


    Widget title =  Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRowWithColor(clearupTitle, fieldColors, heightRowBody*0.2, Top2_TEXT_SIZE),
          genTableRowWithColor(leftRow1CountNew, fieldColors, heightRowBody*0.42, Top2_NUMBER_SIZE )
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
    Widget bigNumber = getBigNumberRow();



    List<int> vendorFaceTypeId = [];
    for(int i=0; i<12; i++) {
      vendorFaceTypeId.add(-1);
    }
    for(int i=0; i<vendorList.length; i++) {
      vendorFaceTypeId[i] = vendorList[i].faceTypeId;
    }

    List<String> vendorTitle2 = [];
    List<String> vendorCount2 = [];
    String other_count = "";
    int sum_filter = 0;
    int other_sum = 0;

    //print('art 0524 bigNumber start');

    for(int i=0; i<vendorFaceTypeId.length; i++) {
      var name = "";
      var countStr = "";
      if(vendorFaceTypeId[i] == -1) {
        name = DEFAULT_VENDOR_NAME;
        countStr = "0";
      } else {
        var filter = profilesRemain.where((element) => element.typeId==vendorFaceTypeId[i]);
         // for(int filterI=0; filterI< filter.length; filterI++) {
         //   print('art 0525 filter ['+ i.toString()  +']=' + filter.toList()[filterI].name + ", " + filter.toList()[filterI].typeId.toString());
         // }

        name = vendorList[i].name;
        countStr = " ${filter.length} (${vendorList[i].worker.toSet().length})";
        if(name.isEmpty) name = VENDOR_NAME_OTHER;
        if(name == VENDOR_NAME_OTHER) {
          sum_filter += filter.length;
          other_sum += vendorList[i].worker.toSet().length;
          other_count =  " $sum_filter (${other_sum})";
          continue;
        }

      }
      vendorTitle2.add(name);
      vendorCount2.add(countStr);
    }
    //若有 '其他' 放最後
    if(other_count.isNotEmpty) {
      vendorTitle2.add(VENDOR_NAME_OTHER);
      vendorCount2.add(other_count);
    }

    //print('art 0524 bigNumber end');
    // vendorCount2[0] = "20";
    // vendorCount2[1] = "20";
    // vendorCount2[2] = "15";
    // vendorCount2[3] = "15";
    // vendorCount2[4] = "10";
    // vendorCount2[5] = "5";
    // vendorCount2[6] = "5";
    // vendorCount2[11] = "5";


    double rowHeight = heightRowBody / 5;
    List<List<String>> dataList = List.generate(4, (index) =>
    [vendorTitle2[index],
      vendorCount2[index].toString(),
      vendorTitle2[index+4],
      vendorCount2[index+4].toString(),
      vendorTitle2[index+8],
      vendorCount2[index+8].toString(),
    ]
    ) ;
    Widget tab = EnviromentTable(height: rowHeight, data: dataList, fontSize: 36,);

    return normalBorderLeftBottom( Container(color: normalBackground,
        height: h,
        child: Column(
          children: [
            bigNumber,
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
        Expanded(flex: 3, child: getMiddleLeft(h)),
        Expanded(flex: 1, child: getMiddleRight(context, h)),
      ]),
    );

  }


  //環境檢測
  Widget getMiddleRight(BuildContext context, double h) {
    List<List<String>> dataList = List.generate(environTitle.length, (index) =>
    [environTitle[index], environCount[index]]) ;
    //[environTitle[index], environCount[index], environColor[index]]) ;
    double hh = 40*1.7;

    Widget w = normalBorder(
    Container(color: normalBackground,
        height: h,
        padding: const EdgeInsets.only(left:20, bottom: 0, right: 0, top:0),
        child: Column(
      children: [
        textSetHeightBold2('$ENVIROMENT', 40, 200),
        EnviromentTable(height: hh, data: dataList, fontSize: 32,),
        //textSetHeightBold2(environUpdateTime, 25, 200),
        Align(alignment: Alignment.centerRight, child: Text(
          environUpdateTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            //fontWeight: FontWeight.bold,
          )
          ,)

        ),
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

    Widget profileListView = ListView.builder(
      //shrinkWrap: true, //just set this property
      scrollDirection: Axis.horizontal,
      itemCount: profiles.length,
      itemBuilder: (BuildContext context, int index) {
        Profile pp = profiles[index];
        //print("art 0530 getRowBottom() pp=${pp.name} ${pp.boolList}");
        return ProfileWidget(profile: pp);
      },
    );

    Widget overlap = Stack(
      alignment: Alignment.centerLeft,
      children: [
        profileListView,

        Positioned(
          bottom:10,
          right: 150,
          child: whiteText(enterWebSocket.length.toString(), 15),
        ),

        Positioned(
          bottom:10,
          right: 125,
          child: whiteText(leaveWebSocket.length.toString(), 15),
        ),

        Positioned(
            bottom:-15,
            right: -10,
            child: Image.asset('images/logo_screen_white.png' , width:120, height:90),
        ),

      ],);

    Widget p = Padding(
        padding: EdgeInsets.only(top: 24.0, left: 15.0),
        child: overlap
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
              fontSize: 30,
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


Widget getRowTop(BuildContext ctx, double hh, String weatherText, Widget _pic) {
  String str1 = headerNews;
  String str2 = formatDateTimeDashBoard(DateTime.now());

  Widget timeW = normalBorderTopLeft(
    centerTextSetHeight(str2, hh)
  );


  Widget weatherStrW = Container(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: hh,
    color: normalBackground,
    child: Center(child: Text(weatherText,
      style: const TextStyle(
        fontSize: 26,
        color: Colors.white,
      ),)),
  );

  Widget weatherPic = Container(
    decoration: BoxDecoration(
      color: normalBackground,
    ),
    height: hh,
    child: _pic ,
  );

  Widget weatherW = normalBorderTopLeftRight(
    Row(
        children: [
          Expanded(flex: 1, child: weatherStrW),
          Expanded(flex: 1, child: weatherPic),
        ])
   );

  Widget timeandWeatherW =  Row(
      children: [
        Expanded(flex: 1, child: timeW),
        Expanded(flex: 1, child: weatherW),
      ]);


 Widget maquee = normalBorderTopLeft(
     addTextBackGround(
         SizedBox(
           //width: mqueeWidth,
           height: hh,
           child: MarqueeWidget(
             direction: Axis.horizontal,
             child: whiteText(str1,  54),
           ),
         )
     )
 );


  Widget left = GestureDetector(
        onTap: () {
          //showDialog(context: ctx, builder: (BuildContext context) => setDevicesDialog(context));
          Navigator.push(ctx,
            MaterialPageRoute(builder: (context) =>  Setting()),
          );
        },
        child: maquee,
      );
  Widget right = GestureDetector(
        onTap: () {
          Navigator.push(ctx,
            MaterialPageRoute(builder: (context) => const TableScreenVideo()),
          );
        },
        child: timeandWeatherW,
      );

  return Row(
        children: [
          Expanded(flex: 3, child: left),
          Expanded(flex: 1, child: right),
  ]);



}