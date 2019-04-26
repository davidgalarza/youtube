import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  final String youtubeUrl;

  YoutubePage(this.youtubeUrl);

  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  YoutubePlayerController _controller;

  void listener() {
    print('SECONDS: ${_controller.value.position.inSeconds}');
    if (_controller.value.playerState == PlayerState.ENDED) {
      print('FINISHED');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          YoutubePlayer(
              aspectRatio: 16/9,
              context: context,
              videoId: YoutubePlayer.convertUrlToId(widget.youtubeUrl),
              autoPlay: true,
              showVideoProgressIndicator: true,
              videoProgressIndicatorColor: Colors.amber,
              progressColors: ProgressColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onPlayerInitialized: (controller) {
                _controller = controller;
                _controller.addListener(listener);
              },
            ),
        ],
      ),
    );
  }
}
