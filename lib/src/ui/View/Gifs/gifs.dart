import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/Functions/get_preview_url.dart';
import 'package:flutter_giphy_picker/src/ui/Functions/parse_exception.dart';
import 'package:flutter_giphy_picker/src/ui/Platforms/platforms_stub.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/categories.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/search.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/select_gif.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GifsView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const GifsView({
    super.key,
    required this.giphyAPI,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<GifsView> createState() => _GifsView();
}

class _GifsView extends State<GifsView> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _categoriesController = ScrollController();

  late SuccessResponseMultiModel response;

  List<GifData> gifs = [];
  List<CategoriesData> categories = [];

  bool error = false;
  Exception? exception;
  bool loading = true;
  bool backLoading = false;

  @override
  void initState() {
    super.initState();

    widget.giphyAPI.categories().then(
      (value) {
        setState(() {
          categories = value.data;
        });
      },
    ).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
    });

    widget.giphyAPI
        .getTrending(
      rating: widget.config.rating,
      bundle: widget.config.bundle,
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
        title: Text(translations(context)?.trending ?? "Trending"),
        actions: [
          if (widget.isSticker
              ? widget.config.functionsSticker.contains(GiphyFunction.search)
              : widget.config.functionsGif.contains(GiphyFunction.search))
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchView(
                      giphyAPI: widget.giphyAPI,
                      config: widget.config,
                      isSticker: widget.isSticker,
                      onSelected: widget.onSelected,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error
              ? Center(
                  child: Text(parseException(exception)),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: categoriesView(context),
                    ),
                    Expanded(
                      child: MasonryGridView.extent(
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
                              getGifPreviewUrlForQuality(
                                gif: gifs[index],
                                quality: widget.config.previewQuality,
                              ),
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget categoriesView(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          if (PlatformsStub().isWeb() ||
              PlatformsStub().isWindows() ||
              PlatformsStub().isLinux() ||
              PlatformsStub().isFuchsia())
            IconButton(
              onPressed: () {
                if (_categoriesController.offset > 400) {
                  _categoriesController.animateTo(
                    _categoriesController.offset - 400,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _categoriesController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
              scrollDirection: Axis.horizontal,
              controller: _categoriesController,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int number) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CategoriesView(
                            giphyAPI: widget.giphyAPI,
                            category: categories[number],
                            config: widget.config,
                            isSticker: widget.isSticker,
                            onSelected: widget.onSelected,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(categories[number].name),
                  ),
                );
              },
            ),
          ),
          if (PlatformsStub().isWeb() ||
              PlatformsStub().isWindows() ||
              PlatformsStub().isLinux() ||
              PlatformsStub().isFuchsia())
            IconButton(
              onPressed: () {
                if (_categoriesController.offset <
                    _categoriesController.position.maxScrollExtent - 400) {
                  _categoriesController.animateTo(
                    _categoriesController.offset + 400,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _categoriesController.animateTo(
                    _categoriesController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
        ],
      ),
    );
  }

  void loadMoreData() {
    widget.giphyAPI
        .getTrending(
      rating: widget.config.rating,
      bundle: widget.config.bundle,
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
