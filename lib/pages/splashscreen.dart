import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSplashScreen extends StatefulWidget {
  @override
  _VideoSplashScreenState createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    _controller = VideoPlayerController.asset('assets/splash_video.mp4')
      ..initialize().then((_) {
        // Check if the video is initialized, and start playing the video
        setState(() {
          _isVideoInitialized = true;
          _controller.play();
        });
      }).catchError((error) {
        print("Error initializing video: $error");
      });

    // Listen for when the video ends and navigate to the next screen
    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          _controller.value.position == _controller.value.duration) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the video player controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isVideoInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(), // Show loading until the video initializes
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}
