import 'package:far_glory_construction_gashboard/util/UIUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

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
          child: centerTextSetHeightBold(list[index]),
        ),
      ),
    );
  }

  Widget centerTextSetHeightBold(String txt) {
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
        return Container(
          height: height,
          color: normalBackground,
          child: Center(
              child: Text(
                txt,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white
                ),
              )),
        );
        break;
    }

  }

}