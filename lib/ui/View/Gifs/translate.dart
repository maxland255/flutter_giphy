import 'package:flutter/material.dart';
import 'package:flutter_giphy/giphy_api.dart';
import 'package:flutter_giphy/ui/View/Gifs/select_gif.dart';
import 'package:flutter_giphy/ui/giphy_config.dart';
import 'package:flutter_giphy/ui/giphy_result.dart';

class TranslateView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const TranslateView({
    super.key,
    required this.giphyAPI,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<TranslateView> createState() => _TranslateView();
}

class _TranslateView extends State<TranslateView> {
  GifData? gif;

  String search = "";

  bool loading = false;
  bool error = false;
  Exception? errorException;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: Text(
                  "Converts words and phrases to the perfect ${widget.isSticker ? "Sticker" : "GIF"}",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: widget.isSticker
                            ? "Search Stickers"
                            : "Search Gifs",
                        hintText: "Use @ to search a user",
                      ),
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      onSubmitted: (_) => searchGifs(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: search.isEmpty ? null : () => searchGifs(),
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            if (loading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (error)
              Center(
                child: Text(errorException.toString()),
              )
            else if (gif == null)
              const Center(
                child: Text("No gif found"),
              )
            else
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectGifView(
                        giphyAPI: widget.giphyAPI,
                        gif: gif!,
                        config: widget.config,
                        onSelected: widget.onSelected,
                      ),
                    ),
                  );
                },
                child: Image.network(
                  gif!.images.previewGif!.url,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return gif!.images.downsizedStill == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            gif!.images.downsizedStill!.url,
                            fit: BoxFit.contain,
                          );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void searchGifs() async {
    setState(() {
      loading = true;
    });

    widget.giphyAPI
        .translate(
      search,
      rating: widget.config.rating,
      sticker: widget.isSticker,
    )
        .then(
      (value) {
        setState(() {
          gif = value.data;
          loading = false;
          error = false;
        });
      },
    ).catchError(
      (error) {
        setState(() {
          errorException = error;
          error = true;
          loading = false;
        });
      },
    );
  }
}
