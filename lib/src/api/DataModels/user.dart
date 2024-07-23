/// A class representing a user on GIPHY.
class UserData {
  /// The URL for this user's avatar image.
  final String avatarUrl;

  /// The URL for this user's banner image.
  Uri get avatarUri => Uri.parse(avatarUrl);

  /// The URL for the banner image that appears atop this user's profile page.
  final String bannerUrl;

  /// The URL for the banner image that appears atop this user's profile page.
  Uri get bannerUri => Uri.parse(bannerUrl);

  /// The URL for this user's GIPHY profile.
  final String profileUrl;

  /// The URL for this user's GIPHY profile.
  Uri get profileUri => Uri.parse(profileUrl);

  /// The username associated with this user.
  final String username;

  /// The display name associated with this user (contains formatting the base username might not).
  final String displayName;

  UserData({
    required this.avatarUrl,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
  });

  UserData.fromJson(Map<String, dynamic> json)
      : this(
          avatarUrl: json['avatar_url'],
          bannerUrl: json['banner_url'],
          profileUrl: json['profile_url'],
          username: json['username'],
          displayName: json['display_name'],
        );
}
