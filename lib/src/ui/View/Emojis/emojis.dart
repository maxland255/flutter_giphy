import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/src/ui/View/Emojis/emojis_variations.dart';
import 'package:flutter_giphy_picker/src/ui/View/Emojis/select_emoji.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_config.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_result.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EmojisView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final Function(GiphyResult) onSelected;

  const EmojisView({
    super.key,
    required this.giphyAPI,
    required this.config,
    required this.onSelected,
  });

  @override
  State<EmojisView> createState() => _EmojisView();
}

class _EmojisView extends State<EmojisView> {
  final ScrollController _scrollController = ScrollController();

  late SuccessEmojiResponseMultiModel response;

  List<EmojiData> emojis = [];

  bool error = false;
  Exception? exception;
  bool loading = true;
  bool backLoading = false;

  @override
  void initState() {
    super.initState();

    widget.giphyAPI.emoji().then(
      (value) {
        setState(() {
          response = value;
          emojis = value.data;
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
        response.pagination.nextCursor! > 0) {
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
        title: Text(translations(context)?.emojis ?? "Emojis"),
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
                  itemCount: emojis.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if ((emojis[index].variationCount ?? 0) > 0) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EmojisVariationsView(
                                giphyAPI: widget.giphyAPI,
                                emoji: emojis[index],
                                config: widget.config,
                                onSelected: widget.onSelected,
                              ),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SelectEmojiView(
                                giphyAPI: widget.giphyAPI,
                                emoji: emojis[index],
                                config: widget.config,
                                onSelected: widget.onSelected,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.network(
                        emojis[index].images.previewGif!.url,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
    );
  }

  void loadMoreData() {
    widget.giphyAPI
        .emoji(
      offset: response.pagination.offset + response.pagination.count,
    )
        .then(
      (value) {
        setState(() {
          response = value;
          emojis.addAll(value.data);
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
