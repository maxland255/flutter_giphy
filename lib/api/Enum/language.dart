/// Giphy supported language
enum GiphyLanguage {
  /// English
  en,

  /// Spanish
  es,

  /// Portuguese
  pt,

  /// Indonesian
  id,

  /// French
  fr,

  /// Arabic
  ar,

  /// Turkish
  tr,

  /// Thai
  th,

  /// Vietnamese
  vi,

  /// German
  de,

  /// Italian
  it,

  /// Japanese
  ja,

  /// Chinese Simplified
  zhCN,

  /// Chinese Traditional
  zhTW,

  /// Russian
  ru,

  /// Korean
  ko,

  /// Polish
  pl,

  /// Dutch
  nl,

  /// Romanian
  ro,

  /// Hungarian
  hu,

  /// Swedish
  sv,

  /// Czech
  cs,

  /// Hindi
  hi,

  /// Bengali
  bn,

  /// Danish
  da,

  /// Farsi
  fa,

  /// Filipino
  tl,

  /// Finnish
  fi,

  /// Hebrew
  he,

  /// Malay
  ms,

  /// Norwegian
  no,

  /// Ukrainian
  uk;

  String get apiValue {
    switch (this) {
      case GiphyLanguage.en:
        return 'en';
      case GiphyLanguage.es:
        return 'es';
      case GiphyLanguage.pt:
        return 'pt';
      case GiphyLanguage.id:
        return 'id';
      case GiphyLanguage.fr:
        return 'fr';
      case GiphyLanguage.ar:
        return 'ar';
      case GiphyLanguage.tr:
        return 'tr';
      case GiphyLanguage.th:
        return 'th';
      case GiphyLanguage.vi:
        return 'vi';
      case GiphyLanguage.de:
        return 'de';
      case GiphyLanguage.it:
        return 'it';
      case GiphyLanguage.ja:
        return 'ja';
      case GiphyLanguage.zhCN:
        return 'zh-CN';
      case GiphyLanguage.zhTW:
        return 'zh-TW';
      case GiphyLanguage.ru:
        return 'ru';
      case GiphyLanguage.ko:
        return 'ko';
      case GiphyLanguage.pl:
        return 'pl';
      case GiphyLanguage.nl:
        return 'nl';
      case GiphyLanguage.ro:
        return 'ro';
      case GiphyLanguage.hu:
        return 'hu';
      case GiphyLanguage.sv:
        return 'sv';
      case GiphyLanguage.cs:
        return 'cs';
      case GiphyLanguage.hi:
        return 'hi';
      case GiphyLanguage.bn:
        return 'bn';
      case GiphyLanguage.da:
        return 'da';
      case GiphyLanguage.fa:
        return 'fa';
      case GiphyLanguage.tl:
        return 'tl';
      case GiphyLanguage.fi:
        return 'fi';
      case GiphyLanguage.he:
        return 'he';
      case GiphyLanguage.ms:
        return 'ms';
      case GiphyLanguage.no:
        return 'no';
      case GiphyLanguage.uk:
        return 'uk';
    }
  }
}
