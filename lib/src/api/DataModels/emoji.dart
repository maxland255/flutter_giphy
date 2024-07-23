import 'package:flutter_giphy_picker/src/api/DataModels/gif.dart';

/// Emoji Data
///
/// This object contains various data points for a single emoji.
class EmojiData extends GifData {
  /// The ID of the emoji group
  final int emojiGroupId;

  /// Name of the emoji variation
  final String variation;

  /// The number of variations associated with the emoji returned from the v2/emoji endpoint
  final int? variationCount;

  EmojiData({
    required super.type,
    required super.id,
    required super.slug,
    required super.url,
    required super.bitlyUrl,
    required super.embedUrl,
    required super.username,
    required super.source,
    required super.rating,
    required super.user,
    required super.sourceTld,
    required super.sourcePostUrl,
    required super.updateDatetime,
    required super.createDatetime,
    required super.importDatetime,
    required super.trendingDatetime,
    required super.images,
    required super.title,
    required super.altText,
    required super.contentUrl,
    required super.isSticker,
    required super.analyticsResponsePayload,
    required super.analytics,
    required this.emojiGroupId,
    required this.variation,
    required this.variationCount,
  });

  EmojiData.fromJson(super.json)
      : emojiGroupId = json["emoji_group_id"],
        variation = json["variation"],
        variationCount = json["variation_count"],
        super.fromJson();
}
