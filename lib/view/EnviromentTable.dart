import 'package:far_glory_construction_dashboard/util/UIUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import '../util/UIUtil.dart';

class EnviromentTable extends StatelessWidget {

  List<List<String>> data;
  double height;
  double fontSize;

  EnviromentTable({required this.height, required this.data, required this.fontSize,});

  @override
  Widget build(BuildContext context) {
    return  Table(
      border: TableBorder.all(
        color: Colors.transparent,
        width: 0,
      ),
      children: List.generate(
        data.length,
            (index) => _createTableRow(data[index]),
        ),
      );

  }

  TableRow _createTableRow(List<String> list) {
    return TableRow(
      children: List.generate(
        list.length,
            (index) => TableCell(
          child: centerTextSetHeightBold(list[index], "colorText"),
        ),
      ),
    );
  }

  Widget centerTextSetHeightBold(String txt, String colorText) {
    if(txt.compareTo('0')==0) {
      txt = " ";
    }
    switch(txt) {
      case 'red':
        return smallCircle(Colors.red);
        break;

      case 'yellow':
        return smallCircle(Colors.yellow);
        break;

      case 'green':
        return smallCircle(Colors.green);
        break;

      default:
        var myColor = Colors.white;
        if(colorText=='red')
          myColor = Colors.red;
        if(colorText=='yellow')
          myColor = Colors.yellow;

        double myFontSize =32;
        if(txt.length>7) myFontSize = 28;
        return Container(
          height: height,
          color: normalBackground,
          child: Center(
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: myFontSize,
                    color: myColor
                ),
              )),
        );
        break;
    }

  }

}