/// A class representing a term.
class TermData {
  /// Term name
  final String name;

  TermData({
    required this.name,
  });

  TermData.fromJson(Map<String, dynamic> json) : name = json["name"];
}
