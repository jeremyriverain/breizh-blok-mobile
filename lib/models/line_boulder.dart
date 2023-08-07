import 'package:breizh_blok_mobile/models/image.dart';

class LineBoulder {
  final String smoothLine;
  final Image rockImage;

  LineBoulder({
    required this.smoothLine,
    required this.rockImage,
  });

  factory LineBoulder.fromJson(Map<String, dynamic> json) {
    return LineBoulder(
      smoothLine: json['smoothLine'],
      rockImage: Image.fromJson(json['rockImage']),
    );
  }
}
