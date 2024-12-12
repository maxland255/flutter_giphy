import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/gifs_categorie.dart';

class CategoriesView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final CategoriesData category;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const CategoriesView({
    super.key,
    required this.giphyAPI,
    required this.category,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<CategoriesView> createState() => _CategoriesView();
}

class _CategoriesView extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: GridView.extent(
        padding: const EdgeInsets.all(16),
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          for (var subCategorie in widget.category.subCategories)
            this.subCategorie(context, subCategorie)
        ],
      ),
    );
  }

  Widget subCategorie(BuildContext context, SubCategories subCategorie) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GifsCategorieView(
              giphyAPI: widget.giphyAPI,
              subCategorie: subCategorie,
              config: widget.config,
              isSticker: widget.isSticker,
              onSelected: widget.onSelected,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          FutureBuilder<String?>(
            future: getSubCategorieGif(subCategorie),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.hasError) {
                return const SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    snapshot.data!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  subCategorie.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> getSubCategorieGif(SubCategories subCategorie) async {
    final SuccessResponseMultiModel response = await widget.giphyAPI.search(
      subCategorie.name,
      rating: widget.config.rating,
      bundle: widget.config.bundle,
      language: widget.config.language,
      limit: 1,
      sticker: widget.isSticker,
    );

    return response.data.first.images.previewGif?.url;
  }
}
