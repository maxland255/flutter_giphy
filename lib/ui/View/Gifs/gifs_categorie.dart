import 'package:flutter/material.dart';
import 'package:flutter_giphy/giphy_api.dart';
import 'package:flutter_giphy/giphy_ui.dart';
import 'package:flutter_giphy/ui/View/Gifs/select_gif.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GifsCategorieView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final SubCategories subCategorie;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const GifsCategorieView({
    super.key,
    required this.giphyAPI,
    required this.subCategorie,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<GifsCategorieView> createState() => _GifsCategorieView();
}

class _GifsCategorieView extends State<GifsCategorieView> {
  final ScrollController _scrollController = ScrollController();

  late SuccessResponseMultiModel response;

  List<GifData> gifs = [];

  bool error = false;
  Exception? exception;
  bool loading = true;
  bool backLoading = false;

  @override
  void initState() {
    super.initState();

    widget.giphyAPI
        .search(
      widget.subCategorie.name,
      rating: widget.config.rating,
      bundle: widget.config.bundle,
      language: widget.config.language,
      sticker: widget.isSticker,
    )
        .then(
      (value) {
        setState(() {
          response = value;
          gifs = value.data;
          loading = false;
        });
      },
    ).catchError((error) {
      setState(() {
        exception = error;
        this.error = true;
        loading = false;
      });
    });

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 200 &&
        !loading &&
        !backLoading &&
        response.pagination.totalCount! > gifs.length) {
      setState(() {
        backLoading = true;
      });

      loadMoreData();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giphy - ${widget.subCategorie.name}"),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error
              ? Center(
                  child: Text(exception.toString()),
                )
              : MasonryGridView.extent(
                  maxCrossAxisExtent: 250,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 7.5,
                  mainAxisSpacing: 7.5,
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: gifs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectGifView(
                              giphyAPI: widget.giphyAPI,
                              gif: gifs[index],
                              config: widget.config,
                              isSticker: widget.isSticker,
                              onSelected: widget.onSelected,
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        gifs[index].images.previewGif!.url,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
    );
  }

  void loadMoreData() {
    widget.giphyAPI
        .search(
      widget.subCategorie.name,
      rating: widget.config.rating,
      bundle: widget.config.bundle,
      language: widget.config.language,
      offset: response.pagination.offset + response.pagination.count,
      sticker: widget.isSticker,
    )
        .then(
      (value) {
        setState(() {
          response = value;
          gifs.addAll(value.data);
          backLoading = false;
        });
      },
    ).catchError((error) {
      setState(() {
        exception = error;
        this.error = true;
        backLoading = false;
      });
    });
  }
}
