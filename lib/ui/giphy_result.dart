/// A class that represents a Giphy result.
///
/// The Giphy result contains the title, URL, preview URL, image URL, and Giphy URL.
class GiphyResult {
  /// The title of the Giphy result.
  final String title;

  /// The URL of the Giphy result.
  final String url;

  /// The preview URL of the Giphy result.
  final String previewUrl;

  /// The image URL of the Giphy result.
  final String? imageUrl;

  /// The Giphy URL of the Giphy result.
  final String giphyUrl;

  GiphyResult({
    required this.title,
    required this.url,
    required this.previewUrl,
    required this.imageUrl,
    required this.giphyUrl,
  });
}
