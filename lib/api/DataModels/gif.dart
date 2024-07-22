import 'package:flutter_giphy_picker/api/DataModels/analytics.dart';
import 'package:flutter_giphy_picker/api/DataModels/image.dart';
import 'package:flutter_giphy_picker/api/DataModels/user.dart';
import 'package:flutter_giphy_picker/api/Enum/rating.dart';

class GifData {
  /// By default, this is almost always GIF.
  final GifType type;

  /// This GIF's unique ID
  final String id;

  /// The unique slug used in this GIF's URL
  final String slug;

  /// The unique URL for this GIF
  final String url;

  /// The unique URL for this GIF
  Uri get uri => Uri.parse(url);

  /// The unique bit.ly URL for this GIF
  final String bitlyUrl;

  /// The unique bit.ly URL for this GIF
  Uri get bitlyUri => Uri.parse(bitlyUrl);

  /// A URL used for embedding this GIF
  final String embedUrl;

  /// A URL used for embedding this GIF
  Uri get embedUri => Uri.parse(embedUrl);

  /// The username this GIF is attached to, if applicable
  final String username;

  /// The page on which this GIF was found
  final String source;

  /// The MPAA-style rating for this content. Examples include Y, G, PG, PG-13 and R
  final Rating rating;

  /// Currently unused
  final String? contentUrl;

  /// Currently unused
  Uri? get contentUri => contentUrl != null ? Uri.parse(contentUrl!) : null;

  /// An object containing data about the user associated with this GIF, if applicable.
  final UserData? user;

  /// The top level domain of the source URL.
  final String sourceTld;

  /// The URL of the webpage on which this GIF was found.
  final String sourcePostUrl;

  /// The URL of the webpage on which this GIF was found.
  Uri get sourcePostUri => Uri.parse(sourcePostUrl);

  /// The date on which this GIF was last updated.
  final DateTime? updateDatetime;

  /// The date this GIF was added to the GIPHY database.
  final DateTime? createDatetime;

  /// The creation or upload date from this GIF's source.
  final DateTime importDatetime;

  /// The date on which this gif was marked trending, if applicable.
  final DateTime trendingDatetime;

  /// An object containing data for various available formats and sizes of this GIF.
  final ImageData images;

  /// The title that appears on giphy.com for this GIF.
  final String title;

  /// Alt text enables assistive programs to read descriptions of GIFs.
  final String? altText;

  /// Whether this GIF is a sticker
  final bool isSticker;

  /// Most of our endpoints return an Analytics Object. The Analytics Object provides URLs so you can register actions, such as when a user views, clicks, or sends a GIF.
  final String? analyticsResponsePayload;

  /// Most of our endpoints return an Analytics Object. The Analytics Object provides URLs so you can register actions, such as when a user views, clicks, or sends a GIF.
  final AnalyticsData? analytics;

  GifData({
    required this.type,
    required this.id,
    required this.slug,
    required this.url,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.rating,
    required this.user,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.updateDatetime,
    required this.createDatetime,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.title,
    required this.altText,
    this.contentUrl,
    this.isSticker = false,
    this.analyticsResponsePayload,
    required this.analytics,
  });

  GifData.fromJson(Map<String, dynamic> json)
      : type = GifType.fromString(json['type']),
        id = json['id'],
        slug = json['slug'],
        url = json['url'],
        bitlyUrl = json['bitly_url'],
        embedUrl = json['embed_url'],
        username = json['username'],
        source = json['source'],
        rating = Rating.fromString(json['rating']),
        contentUrl = json['content_url'],
        user = json['user'] == null ? null : UserData.fromJson(json['user']),
        sourceTld = json['source_tld'],
        sourcePostUrl = json['source_post_url'],
        updateDatetime = json['update_datetime'] == null
            ? null
            : DateTime.parse(json['update_datetime']),
        createDatetime = json['create_datetime'] == null
            ? null
            : DateTime.parse(json['create_datetime']),
        importDatetime = DateTime.parse(json['import_datetime']),
        trendingDatetime = DateTime.parse(json['trending_datetime']),
        images = ImageData.fromJson(json['images']),
        title = json['title'],
        altText = json['alt_text'],
        isSticker = json['is_sticker'] == 1,
        analyticsResponsePayload = json['analytics_response_payload'],
        analytics = json["analytics"] == null
            ? null
            : AnalyticsData.fromJson(json["analytics"]);
}

enum GifType {
  gif,
  emoji,
  video;

  static GifType fromString(String type) {
    switch (type) {
      case 'gif':
        return GifType.gif;
      case "emoji":
        return GifType.emoji;
      case "video":
        return GifType.video;
      default:
        return GifType.gif;
    }
  }
}
