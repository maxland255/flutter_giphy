import 'package:flutter_giphy_picker/api/DataModels/gif.dart';
import 'package:flutter_giphy_picker/api/DataModels/subcategories.dart';

class CategoriesData {
  final String name;
  final String nameEncoded;
  final List<SubCategories> subCategories;
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
