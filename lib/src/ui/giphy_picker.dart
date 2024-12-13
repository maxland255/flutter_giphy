// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_giphy_picker/src/ui/LocalStorage/local_storage.dart';
import 'package:flutter_giphy_picker/src/ui/giphy.dart';

/// Show Giphy Picker
///
/// Show Giphy Picker with the Giphy UI Config
Future<GiphyResult?> showGiphyPicker(
  BuildContext context,

  /// Giphy UI Config
  GiphyUIConfig config, {
  /// Giphy Locale
  ///
  /// This enum represents the supported locales for the Giphy picker.
  ///
  /// If not provided, the locale will be determined from the context.
  GiphyLocale? locale,

  /// Debug Mode
  ///
  /// If true, the Giphy API requests will be logged.
  ///
  /// Default is false.
  bool debugMode = false,
}) async {
  locale ??= GiphyLocale.fromContext(context);
  final width = config.width ?? MediaQuery.of(context).size.width;
  final Completer<GiphyResult?> completer = Completer<GiphyResult?>();

  final String randomID = await getRandomID(config.apiKey);

  final mainContent = Giphy(
      giphyAPI: GiphyAPI(
        apiKey: config.apiKey,
        randomID: randomID,
        debugMode: debugMode,
      ),
      config: config,
      locale: GiphyLocale.fromContext(context),
      themeMode: config.themeMode.toThemeMode(context),
      onSelected: (GiphyResult url) {
        completer.complete(url);
        Navigator.of(context).pop();
      },
      onClosed: () {
        Navigator.of(context).pop();
      });

  if (config.useAlertDialog) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content:
                SizedBox(width: width, child: ClipRect(child: mainContent)));
      },
    );
  } else {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 10,
      constraints: BoxConstraints(maxWidth: width),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      useSafeArea: config.useSafeArea,
      builder: (context) {
        return mainContent;
      },
    );
  }

  return completer.future;
}
