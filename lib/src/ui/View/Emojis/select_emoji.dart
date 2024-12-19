import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_config.dart';
import 'package:flutter_giphy_picker/src/ui/giphy_result.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';

class SelectEmojiView extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final EmojiData emoji;
  final GiphyUIConfig config;
  final bool isSticker;
  final Function(GiphyResult) onSelected;

  const SelectEmojiView({
    super.key,
    required this.giphyAPI,
    required this.emoji,
    required this.config,
    this.isSticker = false,
    required this.onSelected,
  });

  @override
  State<SelectEmojiView> createState() => _SelectEmojiView();
}

class _SelectEmojiView extends State<SelectEmojiView> {
  List<String> favoriteGif = [];

  @override
  void initState() {
    super.initState();

    if (widget.emoji.analytics != null) {
      widget.giphyAPI.analytics(widget.emoji.analytics!.onclick).then((value) {
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
        title: Text(widget.emoji.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Image.network(
              widget.emoji.images.downsized?.url ??
                  widget.emoji.images.original!.webp!,
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
                if (widget.emoji.analytics != null) {
                  widget.giphyAPI
                      .analytics(widget.emoji.analytics!.onsent)
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
                  title: widget.emoji.title,
                  url: widget.emoji.images.original!.webp!,
                  previewUrl: widget.emoji.images.previewGif!.url,
                  imageUrl: widget.emoji.images.downsizedStill?.url,
                  giphyUrl: widget.emoji.url,
                );

                widget.onSelected(result);
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                padding: const EdgeInsets.all(8),
              ),
              child: Text(
                translations(context)?.selectEmoji ?? "Select this Emoji",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
