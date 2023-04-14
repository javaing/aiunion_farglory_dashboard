import 'dart:async';

import 'package:flutter/material.dart';
import '../datamodel/Profile.dart';
import '../util/MarqueeWidget.dart';
import 'package:intl/intl.dart';

import '../util/Utils.dart';
import '../viewmodel/TableScreenViewModel.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'TableScreenVideo.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

enum DisplayMode {
  punch,
  working,
}

const int VENDOR_COLUMN_LIMIT = 4;
const double VENDOR_NAME_WIDTH = 150.0;
const double VENDOR_MANPOWER_WIDTH = 80.0;
const double Top2_TEXT_SIZE = 40.0;
const double Top2_NUMBER_SIZE = 60.0;
DisplayMode currentMode = DisplayMode.punch ;
const Color borderColor = Color.fromARGB(255, 224, 224, 224);
Color normalBackground = const Color.fromARGB(255, 16, 16, 16);
Color enterCountColor = const Color.fromARGB(255, 0, 51, 204);
Color leaveCountColor = const Color.fromARGB(255, 0, 102, 51);
Color resideCountColor = const Color.fromARGB(255, 204, 51, 0);
Color pieChartOrange = const Color.fromARGB(255, 255, 153, 0);

Color pieChart1 = const Color.fromARGB(255, 255, 255, 0);
Color pieChart2 = const Color.fromARGB(255, 0, 39, 204);
Color pieChart3 = const Color.fromARGB(255, 255, 39, 153);
Color pieChart4 = const Color.fromARGB(255, 0, 153, 39);
Color pieChart5 = const Color.fromARGB(255, 0, 255, 255);

Color pieChart6 = const Color.fromARGB(255, 0, 128, 0);
Color pieChart7 = const Color.fromARGB(255, 128, 0, 128);
Color pieChart8 = const Color.fromARGB(255, 128, 128, 0);
Color pieChart9 = const Color.fromARGB(255, 0, 128, 128);
Color pieChart10 = const Color.fromARGB(255, 0, 0, 128);
const double BORER_WIDTH = 3.0;

class _TableScreenState extends State<TableScreen> {
  late String _timeString;
  late Timer _timer;
  late String aa = headerNews;


  @override
  void initState() {
    super.initState();

    _timeString = formatDateTime(DateTime.now());
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());

    TableScreenViewModel viewModel = TableScreenViewModel();

  }


  int profileCount = 0;
  void _getTime() {
    //in setState() UI才會更新
    setState(() {
      _timeString = getformatNow();

      if(profileCount<profilesPool.length) {
        profiles.add(profilesPool[profileCount]);
        profileCount++;
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  late double heightRowTop;
  late double heightRowTop2;
  late double heightRowBody;
  late double heightRowBottom;
  late double widthThirdOne;
  int demoType = 0;

  @override
  Widget build(BuildContext context) {
    heightRowTop = MediaQuery.of(context).size.height * 0.1;
    heightRowTop2 = MediaQuery.of(context).size.height * 0.5;
    heightRowBody = MediaQuery.of(context).size.height * 0.33;
    heightRowBottom = MediaQuery.of(context).size.height * 0.22;

    //_timer.cancel();

    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.fromLTRB(30,0,30,0),
    //     child: Column(
    //       children: [
    //         getRowTop(context, heightRowTop),
    //         getRowTop2(),
    //         getRowBodyNew(),
    //         getRowBottom(),
    //       ],
    //     ),
    //   ),
    // );

    //test long time repaint
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,0,30,0),
        child: Column(
          children: [
            getRowTop(context, heightRowTop),
            getRowTop2(),
            getRadarRow(),
            getRowBottom()
          ],
        ),
      ),
    );


    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.fromLTRB(30,0,30,0),
    //     child: Container(
    //       child: Column(
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 demoType = (demoType+1) % 4;
    //               });
    //             },
    //             child: getCombination(0),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

  }



  final List<ChartData> chartData = [
    ChartData('進場四次', 10),
    ChartData('進場三次', 60),
    ChartData('進場兩次', 100),
    ChartData('進場一次', 180),
  ];

  Widget getRadarRow() {
    return Row(children: [
      normalBorderLeftBottom(Row(children: [
        getRadia(),
        getRadarLenged(),
      ],)
      ),
      normalBorderLeftBottomRight(Row(children: [
        getColumnChart(),
        getColumnLenged(),
      ]),
      )
    ],);
  }

  Widget getRadia() {
    return Container(
        color: normalBackground,
        width: MediaQuery.of(context).size.width * 0.25,
        height: heightRowBody,
        child: SfCircularChart(
            series: <CircularSeries>[
              // Renders radial bar chart
              RadialBarSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.text,
                  yValueMapper: (ChartData data, _) => data.y,
                  cornerStyle: CornerStyle.bothCurve,
                  innerRadius: '30%' //圓心佔比
              )
            ]
        )
    );
  }

  Widget smallCircle(Color cc) {
    return Container(
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: cc,
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.only(top: 15.0, right: 15.0),
    );
  }

  Widget getRadarLenged() {
    List<String> items = [];
    chartData.forEach((element) {
      items.add("${element.text} ${element.y}人");
    });
    print("art getRadarLenged size=${items.length}");
    return
      Container(
          color: normalBackground,
          width: MediaQuery.of(context).size.width * 0.22,
          height: heightRowBody,
          padding: const EdgeInsets.fromLTRB(20, 0,0,0),
          child: Center(child:
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallCircle(Colors.white),
                    whiteText(items[index], 24)
                  ],
                ),
              );
            },
          ),
          )
      );
  }

  final List<ResideChartData> resideData = [
    ResideChartData(8, 88),
    ResideChartData(10, 102),
    ResideChartData(12, 20),
    ResideChartData(14, 102),
  ];

  Widget getColumnChart() {
    return Center(
        child: Container(
            color: normalBackground,
            width: MediaQuery.of(context).size.width * 0.235,
            height: heightRowBody,
            child: SfCartesianChart(
                series: <ChartSeries<ResideChartData, int>>[
                  ColumnSeries<ResideChartData, int>(
                      color: resideCountColor,
                      dataSource: resideData,
                      xValueMapper: (ResideChartData data, _) => data.x,
                      yValueMapper: (ResideChartData data, _) => data.y
                  )
                ]
            )
        )
    );
  }

  String getReasyRead(int oclock) {
    String str = "$oclock點"; //點中午上午下午
    if(oclock==12) {
      str = "中午$oclock點";
    } else if(oclock<12) {
      str = "上午$oclock點";
    } else {
      str = "下午$oclock點";
    }
    return str;
  }

  Widget getColumnLenged() {
    List<String> items = [];
    resideData.forEach((element) {
      items.add("${element.y}人  ${getReasyRead(element.x)}");
    });
    print("art getRadarLenged size=${items.length}");

    Widget ww =  ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallCircle(Colors.white),
              whiteText(items[index], 25)
            ],
          ),
        );
      },
    );

    return
      Container(
          color: normalBackground,
          width: MediaQuery.of(context).size.width * 0.24,
          height: heightRowBody,
          padding: EdgeInsets.fromLTRB(30, 0,0,0),
          child: ww,
          // Column(
          //   children: [
          //     centerTextSetHeight(leftRow1Title[2], 22),
          //     ww
          // ],)
      );
  }


  Widget getCombination(int type) {

    Widget wig;
    switch(type) {
      case 0:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
            getRowTop2(),
            getRadarRow(),
            getRowBottom()
          ],
        );
        break;

      case 1:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
          ],
        );
        break;

      case 2:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
          ],
        );
        break;

      case 3:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
          ],
        );
        break;

      default:
        wig = Column(
          children: [
            getRowTop(context, heightRowTop),
            getRowTop2(),
            getRowBodyNew(),
            getRowBottom()
          ],
        );
    }

    return wig;
  }

  Widget getRowTop2() {
    List<Color> fieldColors = [enterCountColor , leaveCountColor,resideCountColor];
    var sum = vendorCount2.reduce((value, element) => value + element).toInt();
    List<int> leftRow1Count = [ sum, leaveCount, sum-leaveCount];

    return Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRowColor(leftRow1Title, fieldColors, heightRowTop2*0.2, Top2_TEXT_SIZE),
          genTableRowColor(toStringList(leftRow1Count), fieldColors, heightRowTop2*0.42, Top2_NUMBER_SIZE )
        ]
    );

  }

  Widget getRowBody() {
    double hh = heightRowBody / 5;

    //List<String> vendorTitle2 = ['承包商A', '承包商B', '承包商C', '承包商D', '承包商E', '承包商F', '承包商G', '承包商H', '承包商I', '承包商J'];
    //List<double> vendorCount2 = [40, 20, 20, 10, 5, 5, 0, 0, 0, 0];


    return Table(
        border: TableBorder.all(
          color: borderColor,
          width: BORER_WIDTH,
        ),
        children: [
          genTableRow(leftRow1Title, hh),
        ]
    );

    // return normalBorderLeftBottomRight(
    //      gen(dataMap)
    // );
  }


  Widget getRowBodyNew() {
    //左右
    return Row(children: [
      Expanded(flex: 1, child: getRow2LeftNew()),
      Expanded(flex: 2, child: getRow2RightNew()),
    ]);
  }

  Widget getRow2LeftNew() {
    var sum = vendorCount2.reduce((value, element) => value + element);
    Map<String, double> dataMap = {
      leftRow1Title[2]: (sum-leaveCount).toDouble(),
      leftRow1Title[1]: leaveCount.toDouble(),
    };

    final colorList = <Color>[
      pieChartOrange,
      leaveCountColor
    ];

    return normalBorderLeftBottom(
        makePie(appendNumberMap( dataMap), colorList)
    );
  }

  Map<String, double> appendNumberMap(Map<String, double> dataMap) {
    List<String> newKey = dataMap.keys.map((name) => "$name (${dataMap[name]?.toInt().toString()})" ).toList();
    return Map.fromIterables(newKey, dataMap.values);
  }

  Widget makePie(Map<String, double> dataMap, List<Color> colorList) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: normalBackground,
      child: SizedBox(
        height: heightRowBody,
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          legendOptions: const LegendOptions(
            legendTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValuesInPercentage: true,
            decimalPlaces: 0,
          ),
        ),
      ),
    );
  }

  Widget getRow2RightNew() {

    Map<String, double> dataMap = Map.fromIterables(vendorTitle2, vendorCount2);

    final colorList = <Color>[
      pieChart1, pieChart2, pieChart3, pieChart4, pieChart5,
      pieChart6, pieChart7, pieChart8, pieChart9, pieChart10,
    ];

    return normalBorderLeftBottomRight(
        makePie( appendNumberMap(dataMap), colorList)
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
        return ProfileWidget(profile: pp);
      },
    );

    return normalBorderLeftBottomRight(
        addTextBackGround(
            SizedBox(
              height: heightRowBottom,
              child: profileListView,
            )
        )
    );
  }

  Widget getRoBottomNew() {
    Widget profileListView = ListView.builder(
      //shrinkWrap: true, //just set this property
      scrollDirection: Axis.horizontal,
      itemCount: profiles1.length,
      itemBuilder: (BuildContext context, int index) {
        Profile profile = profiles1[index];
        return ProfileWidget(profile: profile);
      },
    );

    Widget profileListView2 = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: profilesRemain.length,
      itemBuilder: (BuildContext context, int index) {
        Profile pp = profilesRemain[index];
        return ProfileWidget(profile: pp);
      },
    );

    Widget w1 = normalBorderLeftBottom(textByCustom(
        60,
        heightRowBottom,
        resideCountColor,
        enterStr,
        30
    ));

    Widget w3 = normalBorderLeftBottom(textByCustom(
        60,
        heightRowBottom,
        leaveCountColor,
        leaveStr,
        30
    ));

    Widget w2 = normalBorderLeftBottom(
        addTextBackGround(
            SizedBox(
              height: heightRowBottom,
              width: 535,
              child: profileListView,
            )
        )
    );

    Widget w4 = normalBorderLeftBottomRight(
        addTextBackGround(
            SizedBox(
              height: heightRowBottom,
              width: 535,
              child: profileListView2,
            )
        )
    );

    return  Row(children: [
      w1,w2,w3, w4
    ],);
  }

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
        alignment: Alignment.centerLeft,
        // Align however you like (i.e .centerRight, centerLeft)
        child: Padding(
          padding: const EdgeInsets.only(left:5, bottom: 0, right: 0, top:0), //apply padding to some sides only
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 22,
              //fontWeight: FontWeight.bold,
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

  TableRow genTableRowColor(List<String> list, List<Color> myColors , double hh, double size) {
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


class ProfileWidget extends StatelessWidget {
  final Profile profile;

  const ProfileWidget({super.key, required this.profile});

  ImageProvider getImage(String path) {
    if(path.contains("/")) {
      return NetworkImage(path);
    } else {
      return Image.asset('images/$path').image;
    }
  }

  @override
  Widget build(BuildContext context) {

    Color tagColor = enterCountColor;
    if(profile.action == leaveStr) {
      tagColor = leaveCountColor;
    }

    return Stack(
      children: [
        Container(
          width: 160,
          padding: const EdgeInsets.fromLTRB(0,10, 0,0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: getImage(profile.imageUrl),
              ),
              SizedBox(height: 4,),
              whiteText( "姓名:${profile.name}", 15),
              whiteText("單位:${profile.profession}", 15),
            ],
          ),
        ),
        // The tag in the top-right corner
        Positioned(
          top: 2,
          right: 10,
          child: Center(child: Container(
              width: 26,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: tagColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: whiteText(profile.action,16)
          ),
          ),
        ),
      ],
    );

  }
}

Widget whiteText(String txt, double size) {
  return Center(child: Text(txt,
    style: TextStyle(
      fontSize: size,
      color: Colors.white,
    ),));
}

Widget addTextBackGround(Widget w) {
  return Container(
    color: normalBackground,
    child: Align(
      alignment: Alignment.bottomCenter,
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
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    color: normalBackground,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: hh,
        child: Center(
          child: whiteText(txt,22),
        ),
      ),

    ),
  );

}

Widget getRowTop(BuildContext ctx, double hh) {
  String str1 = headerNews;
  String str2 = formatDateTimeDashBoard(DateTime.now());

  Widget w = Row(children: [
    normalBorderTopLeft(centerTextSetHeight(str2, hh)),
    normalBorderTopLeftRight(
        Row(children: [
          centerTextSetHeight(headerWeather, hh),
          Container(
            decoration: BoxDecoration(
              color: normalBackground,
            ),
            child: Image.asset('images/weather1.png', width: 60, height: hh, ),
          ),

        ],)

    ),
  ],);

  return
    Row(children: [
      normalBorderTopLeft(
          addTextBackGround(
              SizedBox(
                width: 863,
                height: hh,
                child: MarqueeWidget(
                  direction: Axis.horizontal,
                  child: whiteText(str1,  54),
                ),
              )
          )
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

class ChartData {
  ChartData(this.text, this.y,);
  final String text;
  final num y;
}

class ResideChartData {
  ResideChartData(this.x, this.y);
  final int x;
  final int y;
}