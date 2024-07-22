import 'package:flutter_giphy_picker/api/DataModels/categories.dart';
import 'package:flutter_giphy_picker/api/DataModels/channel.dart';
import 'package:flutter_giphy_picker/api/DataModels/emoji.dart';
import 'package:flutter_giphy_picker/api/DataModels/gif.dart';
import 'package:flutter_giphy_picker/api/DataModels/meta.dart';
import 'package:flutter_giphy_picker/api/DataModels/pagination.dart';
import 'package:flutter_giphy_picker/api/DataModels/term.dart';

/// Response model for Giphy API
/// Only for Trending; Search
class SuccessResponseMultiModel {
  final List<GifData> data;
  final PaginationData pagination;
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

class SuccessResponseSingleModel {
  final GifData? data;
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

class SuccessEmojiResponseMultiModel {
  final List<EmojiData> data;
  final PaginationData pagination;
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

class SuccesEmojiResponseModel {
  final List<EmojiData> data;
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

class SuccessCategoriesResponseModel {
  final List<CategoriesData> data;
  final PaginationData pagination;
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

class SuccessTermResponseModel {
  final List<TermData> data;
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

class SuccessChannelResponseModel {
  final List<ChannelData> data;
  final PaginationData pagination;
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

class SuccessTrendingSearchResponseModel {
  final List<String> data;
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

class SuccessRandomIDResponseModel {
  final String randomID;
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
