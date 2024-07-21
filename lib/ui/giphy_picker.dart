import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_giphy/giphy_api.dart';
import 'package:flutter_giphy/ui/LocalStorage/local_storage.dart';
import 'package:flutter_giphy/ui/giphy.dart';
import 'package:flutter_giphy/ui/giphy_config.dart';
import 'package:flutter_giphy/ui/giphy_result.dart';

/// Show Giphy Picker
///
/// Show Giphy Picker with the Giphy UI Config
Future<GiphyResult?> showGiphyPicker(
  BuildContext context,

  /// Giphy UI Config
  GiphyUIConfig config,
) async {
  final Completer<GiphyResult?> completer = Completer<GiphyResult?>();

  final String randomID = await getRandomID(config.apiKey);

  showModalBottomSheet(
    // ignore: use_build_context_synchronously
    context: context,
    isScrollControlled: true,
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.hardEdge,
    builder: (context) {
      return Giphy(
        giphyAPI: GiphyAPI(
          apiKey: config.apiKey,
          randomID: randomID,
        ),
        config: config,
        onSelected: (GiphyResult url) {
          completer.complete(url);
          Navigator.of(context).pop();
        },
        onClosed: () {
          Navigator.of(context).pop();
        },
      );
    },
  );

  return completer.future;
}
