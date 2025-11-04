import 'package:cloudinary/cloudinary.dart';

class CloudinarySetup {
  static final CloudinarySetup _instance = CloudinarySetup._internal();
  late final Cloudinary _cloudinary;

  factory CloudinarySetup() {
    return _instance;
  }

  CloudinarySetup._internal() {
    _cloudinary = Cloudinary.signedConfig(apiKey: "536376127652262", apiSecret: "YLUovqsmsTEH0ZKi2LyMXq4xnnc", cloudName: "dah5kgjjo",);
  }

  Cloudinary get instance => _cloudinary;

  upload(filePath) async {
    var result = await _cloudinary.upload(file: filePath,);
    print(result);
    return result.url;
  }
}