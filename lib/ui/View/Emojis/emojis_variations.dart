import 'package:flutter/material.dart';
import 'package:flutter_giphy/giphy_api.dart';
import 'package:flutter_giphy/ui/View/Emojis/select_emoji.dart';
import 'package:flutter_giphy/ui/giphy_config.dart';
import 'package:flutter_giphy/ui/giphy_result.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EmojisVariationsView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final EmojiData emoji;
  final GiphyUIConfig config;
  final Function(GiphyResult) onSelected;

  const EmojisVariationsView({
    super.key,
    required this.giphyAPI,
    required this.emoji,
    required this.config,
    required this.onSelected,
  });

  @override
  State<EmojisVariationsView> createState() => _EmojisVariationsView();
}

class _EmojisVariationsView extends State<EmojisVariationsView> {
  List<EmojiData> emojis = [];

  bool error = false;
  Exception? exception;
  bool loading = true;
  bool backLoading = false;

  @override
  void initState() {
    super.initState();

    emojis.add(widget.emoji);

    widget.giphyAPI
        .emojiVariation(
      widget.emoji.id,
    )
        .then(
      (value) {
        setState(() {
          emojis.addAll(value.data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emojis'),
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
                  itemCount: emojis.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
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
}
