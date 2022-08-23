import "dart:io";

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Service {
  static String? dir;

  static String? savePath;
  static Box? box;

  static saveVideo2(String url) async {
    var appDocDir = await getApplicationDocumentsDirectory();
    savePath = appDocDir.path + "/temp.mp4";
    saveToHive(savePath);
    String fileUrl = url;
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      print((count / total * 100).toStringAsFixed(0) + "%");
    });
  }

  static Future saveToHive(path) async {
    box = Hive.box('saveVideo');
    box!.add(path);
  }
}
