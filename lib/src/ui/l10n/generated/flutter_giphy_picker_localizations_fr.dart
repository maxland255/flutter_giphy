import 'flutter_giphy_picker_localizations.dart';

/// The translations for French (`fr`).
class GiphyPickerLocalizationsFr extends GiphyPickerLocalizations {
  GiphyPickerLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get close => 'Fermer';

  @override
  String get translate => 'Traduire';

  @override
  String convert_word_to(String element) {
    return 'Convertit les mots et les phrases en mots parfaits $element';
  }

  @override
  String get search_stickers => 'Rechercher un Stickers';

  @override
  String get search_gif => 'Rechercher un Gifs';

  @override
  String get use_search_user => 'Utiliser @ pour rechercher un utilisateur';

  @override
  String get no_gif_found => 'Aucun gif trouvé';

  @override
  String get trending => 'Tendance';

  @override
  String get favorites => 'Favoris';

  @override
  String get no_favorites_found => 'Aucun favoris trouvé';

  @override
  String get select_gif => 'Sélectionner ce GIF';

  @override
  String get select_sticker => 'Sélectionner ce Sticker';

  @override
  String get select_emoji => 'Sélectionner cet Emoji';

  @override
  String get emojis => 'Emojis';
}
