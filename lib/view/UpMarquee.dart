
import 'dart:async';

import 'package:flutter/cupertino.dart';

class UpMarquee extends StatefulWidget {
  final List<String> items;
  final Duration duration;

  UpMarquee({required this.items, required this.duration});

  @override
  _UpMarqueeState createState() => _UpMarqueeState();
}

class _UpMarqueeState extends State<UpMarquee> {
  double _offset = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _offset -= 50;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final item = widget.items[index % widget.items.length];
          return Transform.translate(
            offset: Offset(0, _offset + index * 50),
            child: Text(item),
          );
        },
      ),
    );
  }
}
