import 'flutter_giphy_picker_localizations.dart';

/// The translations for English (`en`).
class GiphyPickerLocalizationsEn extends GiphyPickerLocalizations {
  GiphyPickerLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get close => 'Close';

  @override
  String get translate => 'Translate';

  @override
  String convert_word_to(String element) {
    return 'Converts words and phrases to the perfect $element';
  }

  @override
  String get search_stickers => 'Search Stickers';

  @override
  String get search_gif => 'Search Gifs';

  @override
  String get use_search_user => 'Use @ to search a user';

  @override
  String get no_gif_found => 'No gif found';

  @override
  String get trending => 'Trending';

  @override
  String get favorites => 'Favorites';

  @override
  String get no_favorites_found => 'No favorites found';

  @override
  String get select_gif => 'Select this GIF';

  @override
  String get select_sticker => 'Select this Sticker';

  @override
  String get select_emoji => 'Select this Emoji';

  @override
  String get emojis => 'Emojis';
}
