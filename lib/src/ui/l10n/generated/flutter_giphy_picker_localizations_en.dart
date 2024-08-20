import 'flutter_giphy_picker_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class GiphyPickerLocalizationsEn extends GiphyPickerLocalizations {
  GiphyPickerLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get close => 'Close';

  @override
  String get translate => 'Translate';

  @override
  String convertWordTo(String element) {
    return 'Converts words and phrases to the perfect $element';
  }

  @override
  String get searchStickers => 'Search Stickers';

  @override
  String get searchGif => 'Search Gifs';

  @override
  String get useSearchUser => 'Use @ to search a user';

  @override
  String get noGifFound => 'No gif found';

  @override
  String get trending => 'Trending';

  @override
  String get favorites => 'Favorites';

  @override
  String get noFavoritesFound => 'No favorites found';

  @override
  String get selectGif => 'Select this GIF';

  @override
  String get selectSticker => 'Select this Sticker';

  @override
  String get selectEmoji => 'Select this Emoji';

  @override
  String get emojis => 'Emojis';
}
