/// GIFs are for everyone, and GIPHY is committed to making sure that its GIF search is a positive experience for everyone. We take content safety extremely seriously. Our GIF and Sticker library is thoroughly moderated and organized by rating in order to give GIPHY users the safest possible search experience. We do not hesitate to remove content that falls outside of our Community Guidelines.
/// More informations on Giphy documentations https://developers.giphy.com/docs/optional-settings/#rating
enum Rating {
  y,

  /// Contains images that are broadly accepted as appropriate and commonly witnessed by people in a public environment.
  g,

  /// Contains images that are commonly witnessed in a public environment, but not as broadly accepted as appropriate.
  pg,

  /// Contains images that are typically not seen unless sought out, but still commonly witnessed.
  pg13,

  /// Contains images that are typically not seen unless sought out and could be considered alarming if witnessed.
  r;

  static Rating fromString(String rating) {
    switch (rating) {
      case 'y':
        return Rating.y;
      case 'g':
        return Rating.g;
      case 'pg':
        return Rating.pg;
      case 'pg-13':
        return Rating.pg13;
      case 'r':
        return Rating.r;
      default:
        return Rating.y;
    }
  }

  String get apiValue {
    switch (this) {
      case Rating.y:
        return 'y';
      case Rating.g:
        return 'g';
      case Rating.pg:
        return 'pg';
      case Rating.pg13:
        return 'pg-13';
      case Rating.r:
        return 'r';
    }
  }
}
