import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ControllerPdfChat extends GetxController {
  int? loadingIndex;

  Future<void> downloadAndOpenFile(String url, String fileName) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/$fileName";

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        File file = File(savePath);
        await file.writeAsBytes(response.bodyBytes);

        await OpenFile.open(savePath);
      } else {
        print("Failed to download file: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      print("Error downloading/opening file: $e");
    }
    loadingIndex=null;
    update();
  }
}