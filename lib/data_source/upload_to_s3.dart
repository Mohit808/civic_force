import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import '../model/model_x.dart';
import '../utils.dart';
import '../utils/app_urls.dart';

Future uploadImageToS3(path) async {
  var headers = {'Authorization': 'token $token'};
  var request = http.MultipartRequest('POST', Uri.parse("${AppUrls.baseUrl}${AppUrls.generatePresignedUrl}"));
  print(AppUrls.baseUrl+AppUrls.generatePresignedUrl);
  print(path);
  request.files.add(await http.MultipartFile.fromPath('file_name', path));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  print(response.statusCode);

  if (response.statusCode == 200) {
    var res=await response.stream.bytesToString();
    ModelX modelX=ModelX.fromJson(jsonDecode(res));
    // print(res);
    return modelX.data['url'];
  }
  else {
    print(response.reasonPhrase);
  }

}
