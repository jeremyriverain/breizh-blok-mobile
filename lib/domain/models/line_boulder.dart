import 'package:breizh_blok_mobile/domain/models/image.dart';

class LineBoulder {
  LineBoulder({
    required this.smoothLine,
    required this.rockImage,
  });

  factory LineBoulder.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'smoothLine': final String smoothLine,
          'rockImage': final Map<String, dynamic> rockImage,
        }) {
      return LineBoulder(
        smoothLine: smoothLine,
        rockImage: Image.fromJson(rockImage),
      );
    }

    throw const FormatException();
  }
  final String smoothLine;
  final Image rockImage;
}
