import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/Favorites/favorites.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/gifs.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/translate.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_config.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_result.dart';

class GifTabView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const GifTabView({
    super.key,
    required this.giphyAPI,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<GifTabView> createState() => _GifTabView();
}

class _GifTabView extends State<GifTabView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    int length = 0;

    if (widget.isSticker) {
      if (widget.config.functionsSticker.contains(GiphyFunction.favorites)) {
        length++;
      }

      if (widget.config.functionsSticker.contains(GiphyFunction.trending)) {
        length++;
      }

      if (widget.config.functionsSticker.contains(GiphyFunction.translate)) {
        length++;
      }
    } else {
      if (widget.config.functionsGif.contains(GiphyFunction.favorites)) {
        length++;
      }

      if (widget.config.functionsGif.contains(GiphyFunction.trending)) {
        length++;
      }

      if (widget.config.functionsGif.contains(GiphyFunction.translate)) {
        length++;
      }
    }

    _tabController = TabController(length: length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          controller: _tabController,
          tabs: [
            if (widget.config.functionsGif.contains(GiphyFunction.favorites))
              const Tab(
                icon: Icon(Icons.favorite),
              ),
            if (widget.config.functionsGif.contains(GiphyFunction.trending))
              const Tab(
                icon: Icon(Icons.trending_up),
              ),
            if (widget.config.functionsGif.contains(GiphyFunction.translate))
              const Tab(
                icon: Icon(Icons.translate),
              ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              if (widget.config.functionsGif.contains(GiphyFunction.favorites))
                FavoritesView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  isSticker: widget.isSticker,
                  onSelected: widget.onSelected,
                ),
              if (widget.config.functionsGif.contains(GiphyFunction.trending))
                GifsView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  isSticker: widget.isSticker,
                  onSelected: widget.onSelected,
                ),
              if (widget.config.functionsGif.contains(GiphyFunction.translate))
                TranslateView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  isSticker: widget.isSticker,
                  onSelected: widget.onSelected,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
