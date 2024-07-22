import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';

/// Giphy UI Config
///
/// apiKey: Giphy API Key
/// themeMode: ThemeMode
/// lightTheme: ThemeData
/// darkTheme: ThemeData
/// rating: Rating
/// language: GiphyLanguage
/// bundle: Bundle
/// show: List<GiphyShow>
/// functionsGif: List<GiphyFunction>
/// functionsSticker: List<GiphyFunction>
class GiphyUIConfig {
  /// Giphy API Key
  final String apiKey;

  /// Theme Mode for the Giphy UI
  final ThemeMode themeMode;

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

  GiphyUIConfig({
    required this.apiKey,
    this.themeMode = ThemeMode.system,
    this.lightTheme,
    this.darkTheme,
    this.rating,
    this.language = GiphyLanguage.en,
    this.bundle,
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

enum GiphyShow {
  gif,
  sticker,
  emoji,
}

enum GiphyFunction {
  favorites,
  search,
  trending,
  translate,
}
