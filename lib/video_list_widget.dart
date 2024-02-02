import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListWidget extends StatefulWidget {
  final String videoUrl;
  const VideoListWidget({super.key, required this.videoUrl});

  @override
  State<VideoListWidget> createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
late YoutubePlayerController ytController;
  late String videoId;
  @override
  void initState() {

    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    super.initState();

    ytController =YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          hideControls: true,
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,

        )
    );
  }
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: YoutubePlayer(
        controller: ytController,

      ),
    );
  }
}
