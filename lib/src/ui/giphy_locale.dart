import 'package:flutter/material.dart';

/// Giphy Locale
///
/// This enum represents the supported locales for the Giphy picker.
enum GiphyLocale {
  /// French
  fr,

  /// English
  en;

  /// Get the GiphyLocale from the context
  static GiphyLocale fromContext(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == "fr") {
      return GiphyLocale.fr;
    } else {
      return GiphyLocale.en;
    }
  }

  /// Get the locale from the GiphyLocale
  Locale get locale {
    switch (this) {
      case GiphyLocale.fr:
        return const Locale("fr");
      case GiphyLocale.en:
        return const Locale("en");
    }
  }
}
