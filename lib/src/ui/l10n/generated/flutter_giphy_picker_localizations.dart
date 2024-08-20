import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'flutter_giphy_picker_localizations_en.dart';
import 'flutter_giphy_picker_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of GiphyPickerLocalizations
/// returned by `GiphyPickerLocalizations.of(context)`.
///
/// Applications need to include `GiphyPickerLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/flutter_giphy_picker_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GiphyPickerLocalizations.localizationsDelegates,
///   supportedLocales: GiphyPickerLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the GiphyPickerLocalizations.supportedLocales
/// property.
abstract class GiphyPickerLocalizations {
  GiphyPickerLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static GiphyPickerLocalizations? of(BuildContext context) {
    return Localizations.of<GiphyPickerLocalizations>(
        context, GiphyPickerLocalizations);
  }

  static const LocalizationsDelegate<GiphyPickerLocalizations> delegate =
      _GiphyPickerLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @translate.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// No description provided for @convertWordTo.
  ///
  /// In en, this message translates to:
  /// **'Converts words and phrases to the perfect {element}'**
  String convertWordTo(String element);

  /// No description provided for @searchStickers.
  ///
  /// In en, this message translates to:
  /// **'Search Stickers'**
  String get searchStickers;

  /// No description provided for @searchGif.
  ///
  /// In en, this message translates to:
  /// **'Search Gifs'**
  String get searchGif;

  /// No description provided for @useSearchUser.
  ///
  /// In en, this message translates to:
  /// **'Use @ to search a user'**
  String get useSearchUser;

  /// No description provided for @noGifFound.
  ///
  /// In en, this message translates to:
  /// **'No gif found'**
  String get noGifFound;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @noFavoritesFound.
  ///
  /// In en, this message translates to:
  /// **'No favorites found'**
  String get noFavoritesFound;

  /// No description provided for @selectGif.
  ///
  /// In en, this message translates to:
  /// **'Select this GIF'**
  String get selectGif;

  /// No description provided for @selectSticker.
  ///
  /// In en, this message translates to:
  /// **'Select this Sticker'**
  String get selectSticker;

  /// No description provided for @selectEmoji.
  ///
  /// In en, this message translates to:
  /// **'Select this Emoji'**
  String get selectEmoji;

  /// No description provided for @emojis.
  ///
  /// In en, this message translates to:
  /// **'Emojis'**
  String get emojis;
}

class _GiphyPickerLocalizationsDelegate
    extends LocalizationsDelegate<GiphyPickerLocalizations> {
  const _GiphyPickerLocalizationsDelegate();

  @override
  Future<GiphyPickerLocalizations> load(Locale locale) {
    return SynchronousFuture<GiphyPickerLocalizations>(
        lookupGiphyPickerLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_GiphyPickerLocalizationsDelegate old) => false;
}

GiphyPickerLocalizations lookupGiphyPickerLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return GiphyPickerLocalizationsEn();
    case 'fr':
      return GiphyPickerLocalizationsFr();
  }

  throw FlutterError(
      'GiphyPickerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
