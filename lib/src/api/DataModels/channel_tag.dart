/// Channel tag data model
class ChannelTagData {
  /// Tag unique ID
  final String id;

  /// The ID of the channel associated with the tag
  final int channel;

  /// The rank of the tag
  final int rank;

  /// The tag
  final String tag;

  ChannelTagData({
    required this.id,
    required this.channel,
    required this.rank,
    required this.tag,
  });

  factory ChannelTagData.fromJson(Map<String, dynamic> json) {
    return ChannelTagData(
      id: json['id'],
      channel: json['channel'],
      rank: json['rank'],
      tag: json['tag'],
    );
  }
}
