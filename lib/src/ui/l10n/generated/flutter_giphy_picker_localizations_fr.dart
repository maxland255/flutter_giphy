import 'flutter_giphy_picker_localizations.dart';

/// The translations for French (`fr`).
class GiphyPickerLocalizationsFr extends GiphyPickerLocalizations {
  GiphyPickerLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get close => 'Fermer';

  @override
  String get translate => 'Traduire';

  @override
  String convertWordTo(String element) {
    return 'Convertit les mots et les phrases en mots parfaits $element';
  }

  @override
  String get searchStickers => 'Rechercher un Stickers';

  @override
  String get searchGif => 'Rechercher un Gifs';

  @override
  String get useSearchUser => 'Utiliser @ pour rechercher un utilisateur';

  @override
  String get noGifFound => 'Aucun gif trouvé';

  @override
  String get trending => 'Tendance';

  @override
  String get favorites => 'Favoris';

  @override
  String get noFavoritesFound => 'Aucun favoris trouvé';

  @override
  String get selectGif => 'Sélectionner ce GIF';

  @override
  String get selectSticker => 'Sélectionner ce Sticker';

  @override
  String get selectEmoji => 'Sélectionner cet Emoji';

  @override
  String get emojis => 'Emojis';
}
