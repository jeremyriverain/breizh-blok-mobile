import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class BoulderDetailsVideos extends StatefulWidget {
  const BoulderDetailsVideos({super.key});

  @override
  State<BoulderDetailsVideos> createState() => _VideoListState();
}

class _VideoListState extends State<BoulderDetailsVideos> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: 'EL439RMv3Xc',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      key: ObjectKey(controller),
      controller: controller,
      actionsPadding: const EdgeInsets.only(left: 16.0),
      bottomActions: const [
        CurrentPosition(),
        SizedBox(width: 10),
        ProgressBar(isExpanded: true),
        SizedBox(width: 10),
        RemainingDuration(),
        FullScreenButton(),
      ],
    );
  }
}
