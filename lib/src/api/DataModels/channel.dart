import 'package:flutter_giphy_picker/src/api/DataModels/channel_tag.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/gif.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/user.dart';

/// Channel Data
class ChannelData {
  /// Channel unique ID
  final int id;

  /// Channel relative URL
  final String? url;

  /// Channel relative URL
  Uri? get uri => url == null ? null : Uri.parse(url!);

  /// The display name of the channel
  final String displayName;

  /// Parent Channel ID
  final int? parent;

  /// The unique channel slug. This slug is used in the channel URL
  final String slug;

  final ChannelType type;

  final ChannelContentType contentType;

  /// An object containing data about the user associated with this Channel
  final UserData user;

  /// Channel banner image URL
  final String? bannerImage;

  /// Channel banner image URL
  Uri? get bannerImageUri =>
      bannerImage == null ? null : Uri.parse(bannerImage!);

  /// The short display name of the channel
  final String shortDisplayName;

  /// Channel description
  final String description;

  /// Channel metadata description
  final String? metadataDescription;

  /// Indicates that the channel has sub-channels
  final bool hasChildren;

  /// Indicates that the channel is visible.
  @Deprecated("This property is deprecated.")
  final bool? isVisible;

  /// Indicates the public visibility of the channel. A private channel can only be viewed by the owner.
  final bool? isPrivate;

  /// Indicates that the channel is live
  @Deprecated("This property is deprecated.")
  final bool? isLive;

  /// An object containing data about the channel's featured gif
  final GifData? featuredGif;

  /// Channel screensaver GIF's ID
  final String? screensaverGif;

  /// List of channel tags
  final List<ChannelTagData> tags;

  final DateTime? liveSinceDatetime;

  final DateTime? liveUntilDatetime;

  /// List of parent channels
  final List<ChannelData> ancestors;

  /// List of channel syncable tags
  final List<ChannelTagData> syncableTags;

  ChannelData({
    required this.id,
    this.url,
    required this.displayName,
    required this.parent,
    required this.slug,
    required this.type,
    required this.contentType,
    required this.user,
    required this.bannerImage,
    required this.shortDisplayName,
    required this.description,
    required this.metadataDescription,
    required this.hasChildren,
    required this.isVisible,
    required this.isPrivate,
    required this.isLive,
    required this.featuredGif,
    required this.screensaverGif,
    required this.tags,
    required this.liveSinceDatetime,
    required this.liveUntilDatetime,
    required this.ancestors,
    required this.syncableTags,
  });

  factory ChannelData.fromJson(Map<String, dynamic> json) {
    return ChannelData(
      id: json['id'],
      url: json['url'],
      displayName: json['display_name'],
      parent: json['parent'],
      slug: json['slug'],
      type: ChannelType.fromString(json['type']),
      contentType: ChannelContentType.fromString(json['content_type']),
      user: UserData.fromJson(json['user']),
      bannerImage: json['banner_image'],
      shortDisplayName: json['short_display_name'],
      description: json['description'],
      metadataDescription: json['metadata_description'],
      hasChildren: json['has_children'],
      isVisible: json['is_visible'],
      isPrivate: json['is_private'],
      isLive: json['is_live'],
      featuredGif: json['featured_gif'] == null
          ? null
          : GifData.fromJson(json['featured_gif']),
      screensaverGif: json['screensaver_gif'],
      tags: (json['tags'] as List)
          .map((tag) => ChannelTagData.fromJson(tag))
          .toList(),
      liveSinceDatetime: json['live_since_datetime'] == null
          ? null
          : DateTime.parse(json['live_since_datetime']),
      liveUntilDatetime: json['live_until_datetime'] == null
          ? null
          : DateTime.parse(json['live_until_datetime']),
      ancestors: (json['ancestors'] as List)
          .map((ancestor) => ChannelData.fromJson(ancestor))
          .toList(),
      syncableTags: json['syncable_tags'] == null
          ? []
          : (json['syncable_tags'] as List)
              .map((tag) => ChannelTagData.fromJson(tag))
              .toList(),
    );
  }
}

enum ChannelType {
  community,
  editorial;

  static ChannelType fromString(String channelType) {
    switch (channelType) {
      case "community":
        return ChannelType.community;
      case "editorial":
        return ChannelType.editorial;
      default:
        return ChannelType.community;
    }
  }

  String get apiValue {
    switch (this) {
      case ChannelType.community:
        return "community";
      case ChannelType.editorial:
        return "editorial";
    }
  }
}

enum ChannelContentType {
  gif,
  sticker,
  channelGif,
  channelSticker;

  static ChannelContentType fromString(String channelContentType) {
    switch (channelContentType) {
      case "gif":
        return ChannelContentType.gif;
      case "sticker":
        return ChannelContentType.sticker;
      case "channel_gif":
        return ChannelContentType.channelGif;
      case "channel_sticker":
        return ChannelContentType.channelSticker;
      default:
        return ChannelContentType.gif;
    }
  }
}
