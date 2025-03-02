import 'package:flutter/material.dart';

import '../../../core/widgets/elevatedbutton/custom_button.dart';

class SpeechButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onPressed;

  const SpeechButton({
    Key? key,
    required this.isListening,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isListening ? Icons.stop_circle_outlined : Icons.mic,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            isListening ? "Stop Recording" : "Start Recording",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

