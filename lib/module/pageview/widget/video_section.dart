import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoSectionMid extends StatefulWidget {
  const VideoSectionMid({super.key});

  @override
  State<VideoSectionMid> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoSectionMid> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/mid.mp4',
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.value.size.width + 100.0;
    _controller.value.size.height + 100.0;
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
