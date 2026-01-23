import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_link.freezed.dart';

part 'video_link.g.dart';

@freezed
abstract class VideoLink with _$VideoLink {
  const factory VideoLink({
    required String url,
    required String videoId,
    required String type,
  }) = _VideoLink;

  const VideoLink._();

  factory VideoLink.fromJson(Map<String, Object?> json) =>
      _$VideoLinkFromJson(json);
}
