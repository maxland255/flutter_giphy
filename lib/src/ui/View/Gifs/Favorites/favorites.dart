import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/LocalStorage/local_storage.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/select_gif.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';

class FavoritesView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const FavoritesView({
    super.key,
    required this.giphyAPI,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<FavoritesView> createState() => _FavoritesView();
}

class _FavoritesView extends State<FavoritesView> {
  final ScrollController _scrollController = ScrollController();

  late SuccessResponseMultiModel response;

  List<GifData> gifs = [];

  bool error = false;
  Exception? exception;
  bool loading = true;
  bool backLoading = false;

  bool selectedGif = false;

  @override
  void initState() {
    super.initState();

    getFavorites();

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
    return FocusDetector(
      onVisibilityGained: !selectedGif
          ? null
          : () {
              getFavorites();

              setState(() {
                selectedGif = false;
              });
            },
      child: Scaffold(
        appBar: AppBar(
          title: Text(translations(context)?.favorites ?? "Favorites"),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : error
                ? Center(
                    child: Text(exception.toString()),
                  )
                : gifs.isEmpty
                    ? Center(
                        child: Text(
                          translations(context)?.no_favorites_found ??
                              "No favorite found",
                        ),
                      )
                    : MasonryGridView.extent(
                        maxCrossAxisExtent: 250,
                        padding: const EdgeInsets.all(16),
                        crossAxisSpacing: 7.5,
                        mainAxisSpacing: 7.5,
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: gifs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGif = true;
                              });

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
      ),
    );
  }

  void getFavorites() async {
    final List<String> favorites = widget.isSticker
        ? await getFavoriteStickers()
        : await getFavoriteGifs();

    if (favorites.isEmpty) {
      setState(() {
        gifs = [];
        loading = false;
      });

      return;
    }

    widget.giphyAPI.getMultipleGifsByID(favorites).then(
      (value) {
        setState(() {
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
  }

  void loadMoreData() async {
    final List<String> favorites = widget.isSticker
        ? await getFavoriteStickers()
        : await getFavoriteGifs();

    if (favorites.isEmpty) {
      setState(() {
        gifs = [];
        loading = false;
      });

      return;
    }

    widget.giphyAPI
        .getMultipleGifsByID(
      favorites,
      rating: widget.config.rating,
      offset: response.pagination.offset + response.pagination.count,
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
