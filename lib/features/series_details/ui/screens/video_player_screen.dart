import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<Map<String, dynamic>> episodes;
  final int initialIndex;

  const VideoPlayerScreen({
    super.key,
    required this.episodes,
    required this.initialIndex,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late int currentIndex;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _initializeVideo(widget.episodes[currentIndex]['thumbnail']);
  }

  void _initializeVideo(String url) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  void _nextEpisode() {
    if (currentIndex < widget.episodes.length - 1) {
      setState(() {
        currentIndex++;
        _controller.dispose();
        _initializeVideo(widget.episodes[currentIndex]['thumbnail']);
      });
    }
  }

  void _previousEpisode() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _controller.dispose();
        _initializeVideo(widget.episodes[currentIndex]['thumbnail']);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildControls() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Colors.red,
            bufferedColor: Colors.grey,
            backgroundColor: Colors.black26,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous, color: Colors.white),
              onPressed: _previousEpisode,
            ),
            IconButton(
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.skip_next, color: Colors.white),
              onPressed: _nextEpisode,
            ),
            IconButton(
              icon: Icon(
                isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: () {
                if (isFullScreen) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                } else {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ]);
                }
                setState(() {
                  isFullScreen = !isFullScreen;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio:
                      isFullScreen
                          ? MediaQuery.of(context).size.aspectRatio
                          : _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [VideoPlayer(_controller), _buildControls()],
                  ),
                )
                : CircularProgressIndicator(),
      ),
    );
  }
}
