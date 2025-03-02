import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/homepage/homepage.dart';
import '../../presentation/pages/imageToText/image_to_text.dart';
import '../../presentation/pages/speechToText/speech_to_text.dart';
import '../../presentation/pages/textToImage/text_to_image_screen.dart';
import '../../presentation/pages/textToSpeech/text_to_speech.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: HomeRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: TextToImageRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: TextToSpeechRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: ImageToTextRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: SpeechToTextRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 400,
    ),
  ];
}
