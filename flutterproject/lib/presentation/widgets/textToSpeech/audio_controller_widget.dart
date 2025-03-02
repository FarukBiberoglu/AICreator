import 'package:flutter/material.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/widgets/container/custom_container.dart';
import '../../../core/widgets/elevatedbutton/custom_button.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioControlsWidget extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final VoidCallback generateAndPlay;
  final bool isPlaying;

  const AudioControlsWidget({super.key, required this.audioPlayer, required this.generateAndPlay, required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContainer(
          color: ColorConstant.primaryPurple,
          child: CustomElevatedButton(
            onPressed: generateAndPlay,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.play_arrow_rounded, color: Colors.white, size: 24),
                SizedBox(width: 8),
                Text(
                  "Play",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomContainer(
          color: ColorConstant.primaryPurple,
          child: CustomElevatedButton(
            onPressed: isPlaying ? () async {
              await audioPlayer.pause();
            } : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.stop_rounded, color: Colors.white, size: 24),
                SizedBox(width: 8),
                Text(
                  "Pause",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
