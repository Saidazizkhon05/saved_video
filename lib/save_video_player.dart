import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:for_video/home.dart';
import 'package:for_video/service.dart';

class SaveVideoPlayer extends StatefulWidget {
  const SaveVideoPlayer({Key? key}) : super(key: key);

  @override
  State<SaveVideoPlayer> createState() => _SaveVideoPlayerState();
}

class _SaveVideoPlayerState extends State<SaveVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Service.savePath.toString()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              String url =
                  'https://ftp1.optimedia.uz/123.mp4';
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
