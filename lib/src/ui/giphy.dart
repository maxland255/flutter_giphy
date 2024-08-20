import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/View/Emojis/emojis.dart';
import 'package:flutter_giphy_picker/src/ui/View/Gifs/gif_tab.dart';
import 'package:flutter_giphy_picker/src/ui/language.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_giphy_picker/src/ui/l10n/generated/flutter_giphy_picker_localizations.dart';

/// Giphy UI
class Giphy extends StatefulWidget {
  final GiphyAPI giphyAPI;
  final GiphyUIConfig config;
  final GiphyLocale locale;
  final ThemeMode themeMode;
  final Function(GiphyResult) onSelected;
  final Function() onClosed;

  const Giphy({
    super.key,
    required this.giphyAPI,
    required this.config,
    required this.locale,
    required this.themeMode,
    required this.onSelected,
    required this.onClosed,
  });

  @override
  State<Giphy> createState() => _Giphy();
}

class _Giphy extends State<Giphy> {
  int get length {
    int length = 0;

    if (widget.config.show.contains(GiphyShow.gif)) {
      length++;
    }

    if (widget.config.show.contains(GiphyShow.sticker)) {
      length++;
    }

    if (widget.config.show.contains(GiphyShow.emoji)) {
      length++;
    }

    return length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GiphyPickerLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("fr"),
      ],
      locale: widget.locale.locale,
      theme: widget.config.lightTheme ??
          ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
          ),
      darkTheme: widget.config.darkTheme ??
          ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
      themeMode: widget.themeMode,
      home: DefaultTabController(
        length: length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Giphy"),
            leading: IconButton(
              icon: const Icon(Icons.close),
              tooltip: translations(context)?.close ?? "Close",
              onPressed: widget.onClosed,
            ),
            bottom: length == 1
                ? null
                : TabBar(
                    tabs: [
                      if (widget.config.show.contains(GiphyShow.gif))
                        const Tab(
                          icon: Icon(Icons.gif_box_outlined),
                        ),
                      if (widget.config.show.contains(GiphyShow.sticker))
                        const Tab(
                          icon: Icon(Icons.sticky_note_2_outlined),
                        ),
                      if (widget.config.show.contains(GiphyShow.emoji))
                        const Tab(
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                    ],
                  ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              if (widget.config.show.contains(GiphyShow.gif))
                GifTabView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  isSticker: false,
                  onSelected: widget.onSelected,
                ),
              if (widget.config.show.contains(GiphyShow.sticker))
                GifTabView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  isSticker: true,
                  onSelected: widget.onSelected,
                ),
              if (widget.config.show.contains(GiphyShow.emoji))
                EmojisView(
                  giphyAPI: widget.giphyAPI,
                  config: widget.config,
                  onSelected: widget.onSelected,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
