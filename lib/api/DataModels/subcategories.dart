class SubCategories {
  final String name;
  final String nameEncoded;

  SubCategories({
    required this.name,
    required this.nameEncoded,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) {
    return SubCategories(
      name: json['name'],
      nameEncoded: json['name_encoded'],
    );
  }
}
