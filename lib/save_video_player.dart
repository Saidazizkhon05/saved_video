import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_video/home.dart';
import 'package:for_video/service.dart';

class SaveVideoPlayer extends StatefulWidget {
  const SaveVideoPlayer({Key? key}) : super(key: key);

  @override
  State<SaveVideoPlayer> createState() => _SaveVideoPlayerState();
}

class _SaveVideoPlayerState extends State<SaveVideoPlayer> {
  @override
  void initState() {
    super.initState();
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (int.parse(Service.percentage) <=100) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Service.percentage + "%"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              String url = 'https://ftp1.optimedia.uz/123.mp4';
              Service.saveVideo2(url);
              print(Service.dir);
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VideoApp(),
                ),
              );
            },
            child: const Text("NEXT"),
          ),
        ],
      ),
    );
  }
}
