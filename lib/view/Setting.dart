import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import '../util/Utils.dart';

void main() {
  runApp(Setting());
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Label and Input Field',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextAndInputFieldPage(),
    );
  }
}

class TextAndInputFieldPage extends StatefulWidget {
  const TextAndInputFieldPage({super.key});

  @override
  _TextAndInputFieldPageState createState() => _TextAndInputFieldPageState();
}

class _TextAndInputFieldPageState extends State<TextAndInputFieldPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerIn = TextEditingController();
  final TextEditingController _controllerOut = TextEditingController();
  final TextEditingController _controllerClear = TextEditingController();
  final TextEditingController _controllerRest = TextEditingController();
  late SharedPreferences prefs;
  String inIDs = "";
  String outIDs = "";
  String clearupTime = "";
  String resetTime = "";


  @override
  void initState() {
    super.initState();
    loadPref();
  }

  void loadPref() async {
    prefs = await SharedPreferences.getInstance() ;
    // setState(() {
    //   _controller.text = prefs.getString(PREF_KEY_WS_SERVER)!;
    //   _controllerIn.text = prefs.getString(PREF_KEY_IN_DEVICEIDS)!;
    //   _controllerOut.text = prefs.getString(PREF_KEY_OUT_DEVICEIDS )!;
    //   _controllerClear.text = prefs.getString(PREF_KEY_CLEARUP_TIME)!;
    //   _controllerRest.text = prefs.getString(PREF_KEY_RESET_TIME )!;
    // });
    _controller.text = await prefs.getString(PREF_KEY_WS_SERVER)!;
    _controllerIn.text = await prefs.getString(PREF_KEY_IN_DEVICEIDS)!;
    _controllerOut.text = await prefs.getString(PREF_KEY_OUT_DEVICEIDS )!;
    _controllerClear.text = await prefs.getString(PREF_KEY_CLEARUP_TIME)!;
    _controllerRest.text = await prefs.getString(PREF_KEY_RESET_TIME )!;
  }

  Future<void> _handleTap() async {
    //所有的進出，除了0以外不可以重複,在設定要做錯誤提示檢核

    // String hostStr =;
    // String inStr = ;
    // String outStr = ;
    // String clearStr =;
    // String resetStr = _controllerRest.text;
    //print('art User input: $hostStr $inStr $outStr $clearStr $resetStr');

    WS_SERVER = _controller.text;

    if(prefs==null)
      prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString(PREF_KEY_WS_SERVER,  _controller.text);
      prefs.setString(PREF_KEY_IN_DEVICEIDS , _controllerIn.text);
      prefs.setString(PREF_KEY_OUT_DEVICEIDS , _controllerOut.text);
      prefs.setString(PREF_KEY_CLEARUP_TIME ,  _controllerClear.text);
      prefs.setString(PREF_KEY_RESET_TIME , _controllerRest.text);

      showMsg(_context, "Save OK");
    });


    //Navigator.pop(context,true);
    //Navigator.of(context).pop();
  }

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;


    Widget row1 = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _handleTap,
          child: const Text('Save'),
        ),
        const SizedBox(width: 36),
      ],
    );

    Widget row2 = Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'WebSocket Host:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: (WS_SERVER),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 36),
      ],
    );

    Widget row3 = Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '進場設備: ',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: _controllerIn,
            decoration: InputDecoration(
              labelText: (inIDs),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 36),
      ],
    );

    Widget row4 = Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '出場設備: ',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: _controllerOut,
            decoration: InputDecoration(
              labelText: (outIDs),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 36),
      ],
    );

    Widget row5 = Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '清場時間: ',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: _controllerClear,
            decoration: InputDecoration(
              labelText: (clearupTime),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 36),
      ],
    );

    Widget row6 = Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '歸零時間: ',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: _controllerRest,
            decoration: InputDecoration(
              labelText: (resetTime),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 36),
      ],
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            row1,
            const SizedBox(height: 20),
            row2,
            const SizedBox(height: 20),
            row3,
            const SizedBox(height: 20),
            row4,
            const SizedBox(height: 20),
            row5,
            const SizedBox(height: 20),
            row6,
          ],
        ),
      ),
    );
  }



}
