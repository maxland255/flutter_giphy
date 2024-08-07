import 'package:flutter_giphy_picker/src/api/DataModels/gif.dart';
import 'package:flutter_giphy_picker/src/api/DataModels/subcategories.dart';

/// Categories Data
///
/// This object contains various data points for a single category.
class CategoriesData {
  /// Category name
  final String name;

  /// Encoded category name
  final String nameEncoded;

  /// List of subcategories
  final List<SubCategories> subCategories;

  ///
  final GifData gif;

  CategoriesData({
    required this.name,
    required this.nameEncoded,
    required this.subCategories,
    required this.gif,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    return CategoriesData(
      name: json['name'],
      nameEncoded: json['name_encoded'],
      subCategories: List<SubCategories>.from(
        json['subcategories'].map(
          (x) => SubCategories.fromJson(x),
        ),
      ),
      gif: GifData.fromJson(json['gif']),
    );
  }
}
