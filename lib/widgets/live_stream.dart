import 'package:final_project/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
    'http://10.0.0.6:8081/video',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VlcPlayer(
              controller: _videoPlayerController,
              aspectRatio: Dimensions.screenWidth / (Dimensions.screenHeight-Dimensions.size200),
              placeholder: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
