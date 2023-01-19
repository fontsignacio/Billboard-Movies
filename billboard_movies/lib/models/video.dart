import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id.toString(), //'Tb9k9_Bo-G4',// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          body: Center(
            child: player
          )
        );
      },
    );
  }

}