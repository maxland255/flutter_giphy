import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';

/// Giphy UI Config
///
/// apiKey: Giphy API Key
/// themeMode: GiphyThemeMode
/// lightTheme: ThemeData
/// darkTheme: ThemeData
/// rating: Rating
/// language: GiphyLanguage
/// bundle: Bundle
/// show: `List<GiphyShow>`
/// functionsGif: `List<GiphyFunction>`
/// functionsSticker: `List<GiphyFunction>`
/// useSafeArea: bool
class GiphyUIConfig {
  /// Giphy API Key
  final String apiKey;

  /// Theme Mode for the Giphy UI
  final GiphyThemeMode themeMode;

  /// Light Theme for the Giphy UI
  final ThemeData? lightTheme;

  /// Dark Theme for the Giphy UI
  final ThemeData? darkTheme;

  /// Rating for Giphy results
  final Rating? rating;

  /// Language for Giphy results
  final GiphyLanguage language;

  /// Bundle for Giphy results
  final Bundle? bundle;

  /// Show Giphy functionnalities (Gif, Sticker, Emoji)
  final List<GiphyShow> show;

  /// Giphy functionnalities for Gif
  final List<GiphyFunction> functionsGif;

  /// Giphy functionnalities for Sticker
  final List<GiphyFunction> functionsSticker;

  /// Use safe area
  final bool useSafeArea;

  GiphyUIConfig({
    required this.apiKey,
    this.themeMode = GiphyThemeMode.app,
    this.lightTheme,
    this.darkTheme,
    this.rating,
    this.language = GiphyLanguage.en,
    this.bundle,
    this.useSafeArea = false,
    this.show = const [GiphyShow.gif, GiphyShow.sticker, GiphyShow.emoji],
    this.functionsGif = const [
      GiphyFunction.favorites,
      GiphyFunction.search,
      GiphyFunction.trending,
      GiphyFunction.translate,
    ],
    this.functionsSticker = const [
      GiphyFunction.favorites,
      GiphyFunction.search,
      GiphyFunction.trending,
      GiphyFunction.translate,
    ],
  }) {
    if (show.contains(GiphyShow.gif)) {
      assert(show.contains(GiphyShow.gif) && functionsGif.isNotEmpty);
    }

    if (show.contains(GiphyShow.sticker)) {
      assert(show.contains(GiphyShow.sticker) && functionsSticker.isNotEmpty);
    }

    if (functionsGif.contains(GiphyFunction.trending) ||
        functionsGif.contains(GiphyFunction.search)) {
      assert(functionsGif.contains(GiphyFunction.trending) &&
          functionsGif.contains(GiphyFunction.search));
    }

    assert(show.isNotEmpty);
  }
}

/// GiphyShow enum is used to decide which type of media to show
///
/// gif: Show Gif
/// sticker: Show Sticker
/// emoji: Show Emoji
enum GiphyShow {
  gif,
  sticker,
  emoji,
}

/// GiphyFunction enum is used to decide which functionnalities to show
///
/// favorites: Show favorites
/// search: Show search
/// trending: Show trending
enum GiphyFunction {
  favorites,
  search,
  trending,
  translate,
}

/// GiphyThemeMode enum is used to decide which theme mode to use
///
/// system: Use system theme mode
/// light: Use light theme mode
/// dark: Use dark theme mode
/// app: Use app theme mode
enum GiphyThemeMode {
  system,
  light,
  dark,
  app;

  ThemeMode toThemeMode(BuildContext context) {
    switch (this) {
      case GiphyThemeMode.system:
        return ThemeMode.system;
      case GiphyThemeMode.light:
        return ThemeMode.light;
      case GiphyThemeMode.dark:
        return ThemeMode.dark;
      case GiphyThemeMode.app:
        return Theme.of(context).brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;
    }
  }
}
