
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TableScreen.dart';
import 'package:video_player/video_player.dart';

class TableScreenVideo extends StatefulWidget {
  const TableScreenVideo({super.key});

  @override
  State<TableScreenVideo> createState() => _TableScreenVideoState();
}

class _TableScreenVideoState extends State<TableScreenVideo> {
  late VideoPlayerController _controller;
  List<String> videoPaths = [
    'videos/demo3.mp4',
    'videos/demo2.mp4',
    'videos/demo1.mp4',
  ];


  @override
  void initState() {
    super.initState();
    startPlay(videoPaths.first);
  }

  void startPlay(String file) {
    _controller = VideoPlayerController.asset(file)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
    _controller.addListener(() {
      //print("art position=${_controller.value.position}  duration=${_controller.value.duration} ");
      if (_controller.value.position >= _controller.value.duration) {
        playNextVideo();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double hh = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(' '),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,0,30,0),
        child: Column(
          children: [
            getRowTop(context, hh),
            getVideoView(),
          ],
        ),
      ),
    );
  }

  Widget getVideoView() {
    return SizedBox(
      height: 550,
      width: double.infinity,
      child: _controller.value.isInitialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int currentIndex = 0;
  void playNextVideo() async {
    currentIndex = currentIndex+1;
    print("art playNext currentIndex=$currentIndex");
    startPlay(videoPaths[currentIndex % videoPaths.length ]);
  }



}