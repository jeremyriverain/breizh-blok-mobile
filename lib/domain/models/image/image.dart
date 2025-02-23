import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
abstract class Image with _$Image {
  const factory Image({
    required String contentUrl,
    String? filterUrl,
    List<String>? imageDimensions,
  }) = _Image;

  const Image._();

  factory Image.fromJson(Map<String, Object?> json) => _$ImageFromJson(json);

  int? get width {
    final dimensions = imageDimensions;
    return dimensions != null && dimensions.length >= 2
        ? int.tryParse(dimensions.first)
        : null;
  }

  int? get height {
    final dimensions = imageDimensions;
    return dimensions != null && dimensions.length >= 2
        ? int.tryParse(dimensions[1])
        : null;
  }
}
