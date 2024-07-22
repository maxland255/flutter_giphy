import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/ui/LocalStorage/local_storage.dart';
import 'package:flutter_giphy_picker/ui/giphy_config.dart';
import 'package:flutter_giphy_picker/ui/giphy_result.dart';

class SelectGifView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GifData gif;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const SelectGifView({
    super.key,
    required this.giphyAPI,
    required this.gif,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<SelectGifView> createState() => _SelectGifView();
}

class _SelectGifView extends State<SelectGifView> {
  List<String> favoriteGif = [];

  @override
  void initState() {
    super.initState();

    loadFavoritesGifs();

    if (widget.gif.analytics != null) {
      widget.giphyAPI.analytics(widget.gif.analytics!.onclick).then((value) {
        if (kDebugMode) {
          print("Giphy Analytics response success: $value");
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("Giphy analytics error: $error");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gif.title),
        actions: [
          if (widget.isSticker
              ? widget.config.functionsSticker.contains(GiphyFunction.favorites)
              : widget.config.functionsGif.contains(GiphyFunction.favorites))
            IconButton(
              icon: Icon(
                favoriteGif.contains(widget.gif.id)
                    ? Icons.favorite
                    : Icons.favorite_outline,
              ),
              onPressed: () async {
                if (widget.isSticker) {
                  if (favoriteGif.contains(widget.gif.id)) {
                    await removeSticker(widget.gif);

                    setState(() {
                      favoriteGif.remove(widget.gif.id);
                    });
                  } else {
                    await saveSticker(widget.gif);

                    setState(() {
                      favoriteGif.add(widget.gif.id);
                    });
                  }
                } else {
                  if (favoriteGif.contains(widget.gif.id)) {
                    await removeGif(widget.gif);

                    setState(() {
                      favoriteGif.remove(widget.gif.id);
                    });
                  } else {
                    await saveGif(widget.gif);

                    setState(() {
                      favoriteGif.add(widget.gif.id);
                    });
                  }
                }
              },
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Image.network(
              widget.gif.images.original!.webp!,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                if (widget.gif.analytics != null) {
                  widget.giphyAPI
                      .analytics(widget.gif.analytics!.onsent)
                      .then((value) {
                    if (kDebugMode) {
                      print("Giphy Analytics response success: $value");
                    }
                  }).catchError((error) {
                    if (kDebugMode) {
                      print("Giphy analytics error: $error");
                    }
                  });
                }

                final result = GiphyResult(
                  title: widget.gif.title,
                  url: widget.gif.images.original!.webp!,
                  previewUrl: widget.gif.images.previewGif!.url,
                  imageUrl: widget.gif.images.downsizedStill?.url,
                  giphyUrl: widget.gif.url,
                );

                widget.onSelected(result);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width / 3, 30),
                elevation: 5,
              ),
              child: const Text("Select Gif"),
            ),
          ),
        ],
      ),
    );
  }

  void loadFavoritesGifs() {
    if (widget.isSticker) {
      getFavoriteStickers().then(
        (value) {
          setState(() {
            favoriteGif = value;
          });
        },
      );
    } else {
      getFavoriteGifs().then(
        (value) {
          setState(() {
            favoriteGif = value;
          });
        },
      );
    }
  }
}
