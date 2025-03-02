// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return HomePage(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ImageToTextPage]
class ImageToTextRoute extends PageRouteInfo<void> {
  const ImageToTextRoute({List<PageRouteInfo>? children})
      : super(
          ImageToTextRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageToTextRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return ImageToTextPage();
    },
  );
}

/// generated route for
/// [SpeechToTextPage]
class SpeechToTextRoute extends PageRouteInfo<void> {
  const SpeechToTextRoute({List<PageRouteInfo>? children})
      : super(
          SpeechToTextRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpeechToTextRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return  SpeechToTextPage();
    },
  );
}

/// generated route for
/// [TextToImagePage]
class TextToImageRoute extends PageRouteInfo<void> {
  const TextToImageRoute({List<PageRouteInfo>? children})
      : super(
          TextToImageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextToImageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return TextToImagePage();
    },
  );
}

/// generated route for
/// [TextToSpeechPage]
class TextToSpeechRoute extends PageRouteInfo<void> {
  const TextToSpeechRoute({List<PageRouteInfo>? children})
      : super(
          TextToSpeechRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextToSpeechRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return TextToSpeechPage();
    },
  );
}
