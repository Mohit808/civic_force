import 'package:mime/mime.dart';

enum MediaType {
  image,
  video,
  audio,
  pdf,
  file,
}



extension MediaTypeX on MediaType {
  String get value {
    switch (this) {
      case MediaType.image:
        return 'image';
      case MediaType.video:
        return 'video';
      case MediaType.audio:
        return 'audio';
      case MediaType.pdf:
        return 'pdf';
      case MediaType.file:
        return 'file';
    }
  }
}

MediaType getMediaTypeFromPath(String path) {
  final mime = lookupMimeType(path) ?? '';

  if (mime.startsWith('image/')) return MediaType.image;
  if (mime.startsWith('video/')) return MediaType.video;
  if (mime.startsWith('audio/')) return MediaType.audio;
  if (mime == 'application/pdf') return MediaType.pdf;

  return MediaType.file;
}
