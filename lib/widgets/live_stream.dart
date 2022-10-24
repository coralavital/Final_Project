import 'package:final_project/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatelessWidget {
  VlcPlayerController videoPlayerController;
  LiveStreamScreen({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VlcPlayer(
            controller: videoPlayerController,
            aspectRatio: Dimensions.screenWidth /
                (Dimensions.screenHeight - Dimensions.size200),
            placeholder: const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
