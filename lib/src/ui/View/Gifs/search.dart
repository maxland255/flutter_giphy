import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/Extension/string_extension.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/select_gif.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const SearchView({
    super.key,
    required this.giphyAPI,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<SearchView> createState() => _SearchView();
}

class _SearchView extends State<SearchView> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _trendingController = ScrollController();

  SuccessResponseMultiModel? response;

  List<String> trendingSearch = [];

  TextEditingController searchController = TextEditingController();

  String search = "";

  Timer? _debounce;
  List<TermData> autoCompleteData = [];

  List<GifData> gifs = [];

  bool backLoading = false;

  @override
  void initState() {
    super.initState();

    widget.giphyAPI.trendingSearch().then(
      (value) {
        setState(() {
          trendingSearch = value.data;
        });
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error);
        }
      },
    );

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 200 &&
        !backLoading &&
        (response?.pagination.totalCount! ?? 1) > gifs.length &&
        search.isNotEmpty) {
      setState(() {
        backLoading = true;
      });

      searchGifs(false);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    setState(() {
      search = value;
    });

    _debounce = Timer(const Duration(milliseconds: 500), () {
      autoComplete();
    });
  }

  void autoComplete() async {
    if (search.isEmpty) {
      setState(() {
        autoCompleteData = [];
      });
      return;
    }

    widget.giphyAPI.autoComplete(search).then(
      (value) {
        setState(() {
          autoCompleteData = value.data;
        });
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSticker
              ? translations(context)?.searchStickers ?? "Search Stickers"
              : translations(context)?.searchGif ?? "Search Gifs",
        ),
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(8),
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: widget.isSticker
                        ? translations(context)?.searchStickers ??
                            "Search Stickers"
                        : translations(context)?.searchGif ?? "Search Gifs",
                    hintText: translations(context)?.useSearchUser ??
                        "Use @ to search a user",
                  ),
                  onChanged: _onSearchChanged,
                  onSubmitted: (_) => searchGifs(true),
                ),
              ),
              IconButton(
                onPressed: search.isEmpty ? null : () => searchGifs(true),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          if (autoCompleteData.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: autoCompleteSearchWidget(),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: trendingSearchWidget(),
          ),
          MasonryGridView.extent(
            maxCrossAxisExtent: 250,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 7.5,
            mainAxisSpacing: 7.5,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
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
        ],
      ),
    );
  }

  Widget trendingSearchWidget() {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          if (kIsWeb || Platform.isWindows || Platform.isLinux)
            IconButton(
              onPressed: () {
                if (_trendingController.offset > 400) {
                  _trendingController.animateTo(
                    _trendingController.offset - 400,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _trendingController.animateTo(
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
              controller: _trendingController,
              itemCount: trendingSearch.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        searchController.text =
                            trendingSearch[index].toCapitalize();
                        search = trendingSearch[index].toCapitalize();
                        searchGifs(true);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.trending_up),
                    label: Text(trendingSearch[index].toCapitalize()),
                  ),
                );
              },
            ),
          ),
          if (kIsWeb || Platform.isWindows || Platform.isLinux)
            IconButton(
              onPressed: () {
                if (_trendingController.offset <
                    _trendingController.position.maxScrollExtent - 400) {
                  _trendingController.animateTo(
                    _trendingController.offset + 400,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _trendingController.animateTo(
                    _trendingController.position.maxScrollExtent,
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

  Widget autoCompleteSearchWidget() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: autoCompleteData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  searchController.text =
                      autoCompleteData[index].name.toCapitalize();
                  search = autoCompleteData[index].name.toCapitalize();
                  searchGifs(true);
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(autoCompleteData[index].name.toCapitalize()),
            ),
          );
        },
      ),
    );
  }

  void searchGifs(bool newSearch) async {
    if (search.isEmpty) {
      return;
    }

    int newOffset = newSearch
        ? 0
        : ((response?.pagination.offset ?? 0) +
            (response?.pagination.count ?? 0));

    widget.giphyAPI
        .search(
      search,
      rating: widget.config.rating,
      bundle: widget.config.bundle,
      language: widget.config.language,
      offset: newOffset,
      sticker: widget.isSticker,
    )
        .then(
      (value) {
        setState(() {
          response = value;
          backLoading = false;
          if (newSearch) {
            gifs = value.data;
          } else {
            gifs.addAll(value.data);
          }
        });
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error);
        }

        setState(() {
          backLoading = false;
        });
      },
    );
  }
}
