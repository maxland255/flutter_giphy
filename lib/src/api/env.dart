class GiphyAPIPath {
  /// Base url
  static const String baseUrl = "api.giphy.com";

  /// Giphy version
  static const String version1 = "/v1";
  static const String version2 = "/v2";

  /// Giff base url
  /// V1
  static const String gif = "/gifs";

  /// Stickers base url
  /// V1
  static const String stickers = "/stickers";

  /// Giphy Emoji base url
  /// V2
  static const String emoji = "/emoji";

  /// Giphy Clips base url
  /// V1
  static const String clips = "/clips";

  // Endpoints

  /// Trending Endpoint
  /// Gifs && Clips
  static const String trending = "/trending";

  /// Search Endpoint
  /// Gifs && Clips
  static const String search = "/search";

  /// Translate Endpoint
  /// Gifs
  static const String translate = "/translate";

  /// Random Endpoint
  /// Gifs
  static const String random = "/random";

  /// Random ID Endpoint
  static const String randomId = "/randomid";

  /// Emoji variation Endpoint
  /// Emoji
  static String emojiVariation(String emojiId) => "/$emojiId/variations";

  /// Get gif by ID
  /// Gifs
  static String gifByID(String gifID) => "/$gifID";

  // Categories

  /// Giff Categories
  /// Gifs
  static const String categories = "/categories";

  // Autocomplete

  /// Giff Autocomplete
  /// Gifs
  static const String autocomplete = "/tags";

  // Channel Search

  /// Giff Channel Search
  static const String channelSearch = "/channels/search";

  /// Search Suggestions
  static String searchSuggestions(String term) => "/tags/related/$term";

  /// Trending Search Terms
  static const String trendingSearchTerms = "/trending/searches";

  /// Clips content
  /// Clips
  static const String clipsContent = "/content";

  /// Clips content by ID
  /// Clips
  static String clipsByID(String id) => "/$clipsContent/$id";
}
