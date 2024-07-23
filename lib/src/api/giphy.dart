import 'package:flutter_giphy_picker/src/api/DataModels/response.dart';
import 'package:flutter_giphy_picker/src/api/Enum/bundle.dart';
import 'package:flutter_giphy_picker/src/api/Enum/language.dart';
import 'package:flutter_giphy_picker/src/api/Enum/rating.dart';
import 'package:flutter_giphy_picker/src/api/Exception/api_exception.dart';
import 'package:flutter_giphy_picker/src/api/Extension/int_extension.dart';
import 'package:flutter_giphy_picker/src/api/env.dart';
import 'package:flutter_giphy_picker/src/api/giphy_api.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/analytics.dart';

/// Giphy API
///
/// This class provides a way to interact with the Giphy API.
class GiphyAPI {
  final String apiKey;
  final String? randomID;

  GiphyAPI({
    required this.apiKey,
    this.randomID,
  });

  /// Get Gifs or Stockers Trending
  /// GIPHY Trending returns a list of the most relevant and engaging content each and every day.
  Future<SuccessResponseMultiModel> getTrending({
    int limit = 25,
    int offset = 0,
    Rating? rating,
    Bundle? bundle,
    bool sticker = false,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for trending endpoint');
    }

    // Verify if limit is an Int32 value
    if (!limit.isInt32 && limit < 1) {
      throw Exception('Limit must be an Int32 value and greater than 0');
    }

    // Verify if offset is an Int32 value
    if (!offset.isInt32 && offset < 0) {
      throw Exception(
        'Offset must be an Int32 value and greater than or equal to 0',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      sticker ? GiphyAPIPath.stickers : GiphyAPIPath.gif,
      GiphyAPIPath.trending,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    if (bundle != null) {
      queryParameters['bundle'] = bundle.apiValue;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseMultiModel.fromJson(responseMap);
  }

  /// Search Gif or Stickers
  /// GIPHY Search gives you instant access to our library of millions of GIFs and Stickers by entering a word or phrase. With our unparalleled search algorithm, users can easily express themselves and animate their conversations.
  Future<SuccessResponseMultiModel> search(
    String query, {
    int limit = 25,
    int offset = 0,
    Rating? rating,
    GiphyLanguage language = GiphyLanguage.en,
    Bundle? bundle,
    bool sticker = false,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for search endpoint');
    }

    // Verify if limit is an Int32 value
    if (!limit.isInt32 && limit < 1) {
      throw Exception('Limit must be an Int32 value and greater than 0');
    }

    // Verify if offset is an Int32 value
    if (!offset.isInt32 && offset < 0) {
      throw Exception(
        'Offset must be an Int32 value and greater than or equal to 0',
      );
    }

    // Verify if query is not empty and the maximum length is 50 characters
    if (query.isEmpty || query.length > 50) {
      throw Exception(
        'Query must not be empty and have a maximum length of 50 characters',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      sticker ? GiphyAPIPath.stickers : GiphyAPIPath.gif,
      GiphyAPIPath.search,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      'q': query,
      'limit': limit.toString(),
      'offset': offset.toString(),
      'lang': language.apiValue,
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    if (bundle != null) {
      queryParameters['bundle'] = bundle.apiValue;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseMultiModel.fromJson(responseMap);
  }

  /// Translate a word into a Gif or Sticker
  /// GIPHY Translate converts words and phrases to the perfect GIF or Sticker using GIPHY's special sauce algorithm. This feature is best exhibited in GIPHY's Slack integration.
  Future<SuccessResponseSingleModel> translate(
    String query, {
    Rating? rating,
    bool sticker = false,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for translate endpoint');
    }

    // Verify if query is not empty and the maximum length is 50 characters
    if (query.isEmpty || query.length > 50) {
      throw Exception(
        'Query must not be empty and have a maximum length of 50 characters',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      sticker ? GiphyAPIPath.stickers : GiphyAPIPath.gif,
      GiphyAPIPath.translate,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      's': query,
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseSingleModel.fromJson(responseMap);
  }

  /// Get a random Gif or Sticker
  /// GIPHY Random lets you add some weirdness to the conversation by returning a single random GIF or Sticker related to the word or phrase entered. If no tag is specified, the GIF or Sticker returned is completely random.
  Future<SuccessResponseSingleModel> random(
    String tag, {
    Rating? rating,
    bool sticker = false,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for random endpoint');
    }

    // Verify if query is not empty and the maximum length is 50 characters
    if (tag.isEmpty || tag.length > 50) {
      throw Exception(
        'Query must not be empty and have a maximum length of 50 characters',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      sticker ? GiphyAPIPath.stickers : GiphyAPIPath.gif,
      GiphyAPIPath.translate,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      'tag': tag,
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseSingleModel.fromJson(responseMap);
  }

  /// Get emoji
  /// GIPHY has released a feature across all GIPHY apps and platforms that makes GIPHY’s uniquely diverse emoji library more accessible than ever. Pairing custom artwork with a purpose-built API endpoint, GIPHY emojis allow you to bring animated reaction emojis to your users with style and ease.
  Future<SuccessEmojiResponseMultiModel> emoji({
    int limit = 25,
    int offset = 0,
  }) async {
    // Verify if limit is an Int32 value
    if (!limit.isInt32 && limit < 1) {
      throw Exception('Limit must be an Int32 value and greater than 0');
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version2,
      GiphyAPIPath.emoji,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessEmojiResponseMultiModel.fromJson(responseMap);
  }

  /// Get emoji variation
  /// Fetch the variations associated with a given emoji.
  Future<SuccesEmojiResponseModel> emojiVariation(
    String emojiID,
  ) async {
    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version2,
      GiphyAPIPath.emoji,
      GiphyAPIPath.emojiVariation(emojiID),
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccesEmojiResponseModel.fromJson(responseMap);
  }

  /// Get a gif from an ID
  /// Get GIF by ID returns a GIF’s metadata based on the GIF ID specified.
  Future<SuccessResponseSingleModel> getGifByID(
    String gifID, {
    Rating? rating,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for getGifByID endpoint');
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.gif,
      GiphyAPIPath.gifByID(gifID),
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseSingleModel.fromJson(responseMap);
  }

  /// Get multiple gifs from an IDs
  /// Get GIFs by ID returns metadata of multiple GIFs based on the GIF IDs specified.
  Future<SuccessResponseMultiModel> getMultipleGifsByID(
    List<String> gifsID, {
    Rating? rating,
    int limit = 25,
    int offset = 0,
  }) async {
    // Verify if rating is not "y"
    if (rating == Rating.y) {
      throw Exception('Rating "y" is not supported for getGifByID endpoint');
    }

    // Verify if limit is an Int32 value
    if (!limit.isInt32 && limit < 1) {
      throw Exception('Limit must be an Int32 value and greater than 0');
    }

    // Verify if offset is an Int32 value
    if (!offset.isInt32 && offset < 0) {
      throw Exception(
        'Offset must be an Int32 value and greater than or equal to 0',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.gif,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      "ids": gifsID.join(","),
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    if (rating != null) {
      queryParameters['rating'] = rating.apiValue;
    }

    if (randomID != null) {
      queryParameters['random_id'] = randomID;
    }

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessResponseMultiModel.fromJson(responseMap);
  }

  /// Get gifs categories
  /// Providers users a list of Gif categories on the GIPHY network.
  Future<SuccessCategoriesResponseModel> categories() async {
    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.gif,
      GiphyAPIPath.categories,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessCategoriesResponseModel.fromJson(responseMap);
  }

  /// Auto complete
  /// Providers users a list of valid terms that completes the given tag on the GIPHY network.
  Future<SuccessTermResponseModel> autoComplete(
    String tagTerm, {
    int limit = 5,
    int offset = 0,
  }) async {
    // Verify if limit is an Int32 value
    if (!limit.isInt32 && limit < 1) {
      throw Exception('Limit must be an Int32 value and greater than 0');
    }

    // Verify if offset is an Int32 value
    if (!offset.isInt32 && offset < 0) {
      throw Exception(
        'Offset must be an Int32 value and greater than or equal to 0',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.gif,
      GiphyAPIPath.search,
      GiphyAPIPath.autocomplete,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      "q": tagTerm,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessTermResponseModel.fromJson(responseMap);
  }

  /// Search a channel
  /// Channel Search endpoint returns all the GIPHY channels matching the query term
  Future<SuccessChannelResponseModel> channelSearch(
    String query, {
    int limit = 25,
    int offset = 0,
  }) async {
    // Verify if limit is an Int32 value
    if (limit < 1 && limit > 50) {
      throw Exception('Limit must be an Int32 value and between 1 and 50');
    }

    // Verify if offset is an Int32 value
    if (!offset.isInt32 && offset < 0) {
      throw Exception(
        'Offset must be an Int32 value and greater than or equal to 0',
      );
    }

    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.channelSearch,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
      "q": query,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessChannelResponseModel.fromJson(responseMap);
  }

  /// Search a term
  /// Providers users a list of tag terms related to the given tag on the GIPHY network.
  Future<SuccessTermResponseModel> termSearch(String term) async {
    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.searchSuggestions(term),
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessTermResponseModel.fromJson(responseMap);
  }

  /// Get trending search
  /// Provides users a list of the most popular trending search terms on the GIPHY network.
  Future<SuccessTrendingSearchResponseModel> trendingSearch() async {
    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.trendingSearchTerms,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessTrendingSearchResponseModel.fromJson(responseMap);
  }

  /// Create a randomID
  /// GIPHY Random ID Endpoint allows GIPHY to generate a unique ID you can assign to each new user in your app.
  /// More info on Giphy documentation: https://developers.giphy.com/docs/api/endpoint#random-id
  static Future<SuccessRandomIDResponseModel> createRandomID(
    String apiKey,
  ) async {
    const baseUrl = GiphyAPIPath.baseUrl;

    final pathSegments = [
      GiphyAPIPath.version1,
      GiphyAPIPath.randomId,
    ];

    Map<String, dynamic> queryParameters = {
      'api_key': apiKey,
    };

    // Make the request

    final responseMap = await GiphyApiManager.get(
      baseUrl,
      pathSegments,
      queryParameters: queryParameters,
    );

    // Parse the response

    return SuccessRandomIDResponseModel.fromJson(responseMap);
  }

  /// Send analytics to Giphy Analytics
  ///
  /// Use this method with the url found in the [AnalyticsData] object.
  ///
  /// More info on Giphy documentation: https://developers.giphy.com/docs/api/endpoint#action-register
  ///
  /// WARNING: RandomID must be set before using this method.
  Future<bool> analytics(
    String url,
  ) async {
    if (randomID == null) {
      throw ApiException(
        "randomID can not be null",
        null,
      );
    }

    return await GiphyApiManager.getUri(url, randomID!);
  }
}
