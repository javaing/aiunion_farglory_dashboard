import 'package:far_glory_construction_gashboard/service/mqtt_service.dart';
import 'package:flutter/material.dart';

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

  void _handleTap() {
    String inputText = _controller.text;
    //print('User input: $inputText');
    // You can add any other logic you want to execute on button tap here.
    MQTT_SERVER = inputText;
    MQTTService();
    showMsg(_context, "Save OK");
    //Navigator.pop(context,true);
    //Navigator.of(context).pop();



  }

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MQTT Host:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: (MQTT_SERVER),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _handleTap,
              child: const Text('Save'),
            ),
            const SizedBox(width: 36),
          ],
        ),
      ),
    );
  }
}
