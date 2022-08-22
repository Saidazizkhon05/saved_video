import "dart:io";

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class Service {
  static String? dir;
  static String? subName;
static String? savePath;
  static saveVideo2(String url) async {
    var appDocDir = await getTemporaryDirectory();
    savePath = appDocDir.path + "/temp.mp4";
    String fileUrl = url;
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      print((count / total * 100).toStringAsFixed(0) + "%");
    });
    final result = await ImageGallerySaver.saveFile(savePath!);
    print(result);
  }

  // static saveVideo(url) async {
     // String url = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
  //   var getAppDir = await getApplicationDocumentsDirectory();
  //   String videoName = url.split('/').last;
  //   dir = "${getAppDir.path}/OPTIMEDIA";
     // print("PRINT IS HERE: $dir");
  //   await Dio().download(url, dir);
     // print("PRINT IS HERE: $dir");
  //   final result = await ImageGallerySaver.saveFile(dir!);
  //   print("PRINT PATHHH: $dir");
  //   return result;
  // }

  static viewVideo(String path) {
    VideoPlayerController.file(File(dir!));
  }
}
