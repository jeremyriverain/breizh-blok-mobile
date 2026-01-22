import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BoulderDetailsVideo extends StatefulWidget {
  const BoulderDetailsVideo({super.key});

  @override
  State<BoulderDetailsVideo> createState() => _BoulderDetailsVideoState();
}

class _BoulderDetailsVideoState extends State<BoulderDetailsVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'nPt8bK2gbaU',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,

        showVideoProgressIndicator: true,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        bottomActions: const [
          CurrentPosition(),
          SizedBox(width: 10),
          ProgressBar(isExpanded: true),
          SizedBox(width: 10),
          RemainingDuration(),
          PlaybackSpeedButton(),
        ],
      ),
      builder: (context, player) => player,
    );
  }
}
