/// The data model for the analytics data.
class AnalyticsData {
  /// The URL to register a 'view' action by a user.
  final String onload;

  /// The URL to register a 'view' action by a user.
  Uri get onloadUri => Uri.parse(onload);

  /// The URL to register a 'click' action by a user.
  final String onclick;

  /// The URL to register a 'click' action by a user.
  Uri get onclickUri => Uri.parse(onclick);

  /// The URL to register a 'send' action by a user.
  final String onsent;

  /// The URL to register a 'send' action by a user.
  Uri get onsentUri => Uri.parse(onsent);

  final String? onstart;
  Uri? get onstartUri => onstart == null ? null : Uri.parse(onstart!);

  AnalyticsData({
    required this.onload,
    required this.onclick,
    required this.onsent,
    required this.onstart,
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      onload: json['onload']["url"],
      onclick: json['onclick']["url"],
      onsent: json['onsent']["url"],
      onstart: json['onstart'] == null ? null : json['onstart']["url"],
    );
  }
}
