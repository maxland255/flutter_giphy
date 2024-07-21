class TermData {
  final String name;

  TermData({
    required this.name,
  });

  TermData.fromJson(Map<String, dynamic> json) : name = json["name"];
}
