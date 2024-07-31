import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoPageWidget();
  }
}

class VideoPageWidget extends State<StatefulWidget> {
  VideoPlayerController player = VideoPlayerController.asset("asset/your_video.mp4");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.initialize().then((_) {
      setState(() {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft, //全屏时旋转方向，左边
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
        player.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: SizedBox.expand(
            child: FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(height: 9, width: 16, child: VideoPlayer(player)),
    )));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
}
