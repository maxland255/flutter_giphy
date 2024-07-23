/// SubCategories model class
///
/// This object contains various data points for a single subcategory.
class SubCategories {
  /// Category name
  final String name;

  /// Encoded category name
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
