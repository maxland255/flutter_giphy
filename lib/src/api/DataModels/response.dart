import 'package:flutter_giphy_picker/src/api/DataModels/categories.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/channel.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/emoji.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/gif.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/meta.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/pagination.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/term.dart';

/// Response model for Giphy API
/// Only for Trending; Search
class SuccessResponseMultiModel {
  /// List of GifData
  final List<GifData> data;

  /// Pagination data
  final PaginationData pagination;

  /// Meta data
  final MetaData meta;

  SuccessResponseMultiModel({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory SuccessResponseMultiModel.fromJson(Map<String, dynamic> json) {
    return SuccessResponseMultiModel(
      data: List<GifData>.from(
        json['data'].map(
          (x) => GifData.fromJson(x),
        ),
      ),
      pagination: PaginationData.fromJson(json['pagination']),
      meta: MetaData.fromJson(json['meta']),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Random; Translate; GifByID; StickerByID
class SuccessResponseSingleModel {
  /// GifData
  final GifData? data;

  /// Meta data
  final MetaData meta;

  SuccessResponseSingleModel({
    required this.data,
    required this.meta,
  });

  factory SuccessResponseSingleModel.fromJson(Map<String, dynamic> json) {
    return SuccessResponseSingleModel(
      data:
          json["data"] is List<dynamic> ? null : GifData.fromJson(json["data"]),
      meta: MetaData.fromJson(json['meta']),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Emoji
class SuccessEmojiResponseMultiModel {
  /// List of EmojiData
  final List<EmojiData> data;

  /// Pagination data
  final PaginationData pagination;

  /// Meta data
  final MetaData meta;

  SuccessEmojiResponseMultiModel({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory SuccessEmojiResponseMultiModel.fromJson(Map<String, dynamic> json) {
    return SuccessEmojiResponseMultiModel(
      data: List<EmojiData>.from(
        json['data'].map(
          (x) => EmojiData.fromJson(x),
        ),
      ),
      pagination: PaginationData.fromJson(json['pagination']),
      meta: MetaData.fromJson(json['meta']),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Emoji
class SuccesEmojiResponseModel {
  /// List of EmojiData
  final List<EmojiData> data;

  /// Meta data
  final MetaData meta;

  SuccesEmojiResponseModel({
    required this.data,
    required this.meta,
  });

  factory SuccesEmojiResponseModel.fromJson(Map<String, dynamic> json) {
    return SuccesEmojiResponseModel(
      data: List<EmojiData>.from(
        json["data"].map(
          (x) => EmojiData.fromJson(x),
        ),
      ),
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Categories
class SuccessCategoriesResponseModel {
  /// List of CategoriesData
  final List<CategoriesData> data;

  /// Pagination data
  final PaginationData pagination;

  /// Meta data
  final MetaData meta;

  SuccessCategoriesResponseModel({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory SuccessCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return SuccessCategoriesResponseModel(
      data: List<CategoriesData>.from(
        json['data'].map(
          (x) => CategoriesData.fromJson(x),
        ),
      ),
      pagination: PaginationData.fromJson(json['pagination']),
      meta: MetaData.fromJson(json['meta']),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Terms
class SuccessTermResponseModel {
  /// List of TermData
  final List<TermData> data;

  /// Meta data
  final MetaData meta;

  SuccessTermResponseModel({
    required this.data,
    required this.meta,
  });

  factory SuccessTermResponseModel.fromJson(Map<String, dynamic> json) {
    return SuccessTermResponseModel(
      data: List<TermData>.from(
        json["data"].map(
          (x) => TermData.fromJson(x),
        ),
      ),
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}

/// Response model for Giphy API
///
/// Only for Channel
class SuccessChannelResponseModel {
  /// List of ChannelData
  final List<ChannelData> data;

  /// Pagination data
  final PaginationData pagination;

  /// Meta data
  final MetaData meta;

  SuccessChannelResponseModel({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory SuccessChannelResponseModel.fromJson(Map<String, dynamic> json) {
    return SuccessChannelResponseModel(
      data: List<ChannelData>.from(
        json["data"].map(
          (x) => ChannelData.fromJson(x),
        ),
      ),
      pagination: PaginationData.fromJson(json["pagination"]),
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}

/// Response model for Giphy API
///
/// Only for trending search
class SuccessTrendingSearchResponseModel {
  /// List of String
  final List<String> data;

  /// Meta data
  final MetaData meta;

  SuccessTrendingSearchResponseModel({
    required this.data,
    required this.meta,
  });

  factory SuccessTrendingSearchResponseModel.fromJson(
      Map<String, dynamic> json) {
    return SuccessTrendingSearchResponseModel(
      data: List<String>.from(json["data"]),
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}

/// Response model for Giphy API
///
/// Only for RandomID
class SuccessRandomIDResponseModel {
  /// Random ID
  final String randomID;

  /// Meta data
  final MetaData meta;

  SuccessRandomIDResponseModel({
    required this.randomID,
    required this.meta,
  });

  factory SuccessRandomIDResponseModel.fromJson(Map<String, dynamic> json) {
    return SuccessRandomIDResponseModel(
      randomID: json["data"]["random_id"],
      meta: MetaData.fromJson(json["meta"]),
    );
  }
}
