import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/constant/color_constant.dart';
import 'package:flutterproject/presentation/pages/textToSpeech/text_to_speech.dart';
import '../../../data/repository/ai_repository.dart';
import '../../../data/service/text_to_speech.dart';

mixin TextToSpeechMixin on State<TextToSpeechPage> {
  final TextToSpeechService service = TextToSpeechService();
  final TextEditingController controller = TextEditingController();
  late AudioPlayer audioPlayer;

  PlayerState? _playerState;
  Duration? duration;
  Duration? position;
  bool isLoading = false;



  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.clear();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.setVolume(1);

    audioPlayer.onDurationChanged.listen((duration) {
      setState(() => duration = duration);
    });

    audioPlayer.onPositionChanged.listen((position) {
      setState(() => position = position);
    });

    audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _playerState = PlayerState.stopped;
        position = Duration.zero;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() => _playerState = state);
    });
  }

  bool get isPlaying => _playerState == PlayerState.playing;





  Future<void> generateAndPlay() async {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Lütfen metin giriniz'),
          backgroundColor: ColorConstant.primaryPurple,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    setState(() => isLoading = true);
    if(!mounted) return;

    try {
      final audioData = await AiRepository().generateSpeech(controller.text);
      if (audioData != null) {
        await audioPlayer.stop();
        await audioPlayer.play(BytesSource(audioData));
        setState(() => _playerState = PlayerState.playing);
      } else {
        showError('Ses oluşturulamadı. Lütfen tekrar deneyin.');
      }
    } catch (e) {
      showError('Hata: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }



  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}