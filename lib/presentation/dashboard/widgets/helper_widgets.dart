import 'package:success_clinic/models/video_info.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Future<VideoInfo> fetchVideoInfo(String videoUrl) async {
  final yt = YoutubeExplode();
  final video = await yt.videos.get(videoUrl);
  final info = VideoInfo(
    videoId: video.id.value,
    title: video.title,
    description: video.description,
    thumbnailUrl: video.thumbnails.highResUrl,
  );
  yt.close();
  return info;
}

class VideoPreviewTile extends StatefulWidget {
  final VideoInfo info;

  const VideoPreviewTile({super.key, required this.info});

  @override
  State<VideoPreviewTile> createState() => _VideoPreviewTileState();
}

class _VideoPreviewTileState extends State<VideoPreviewTile> {
  final String _videoUrl =
      'https://www.youtube.com/watch?v=FboRLOqOlIg&list=LL&index=7';

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(_videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  void _openVideo(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: AspectRatio(
          aspectRatio: 9 / 16,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Player is ready.'),
            aspectRatio: 9 / 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openVideo(context),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.info.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.info.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.info.thumbnailUrl,
              width: 130,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
