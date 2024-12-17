import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';

String getGifPreviewUrlForQuality({
  required GifData gif,
  required PreviewQuality quality,
}) {
  String? url;

  switch (quality) {
    case PreviewQuality.original:
      url = gif.images.original?.webp;
      break;
    case PreviewQuality.large:
      url = gif.images.downsizedLarge?.url;
      break;
    case PreviewQuality.medium:
      url = gif.images.downsizedMedium?.url;
      break;
    case PreviewQuality.small:
      url = gif.images.downsized?.url;
      break;
    case PreviewQuality.preview:
      url = gif.images.previewGif?.url;
      break;
  }

  return url ?? gif.images.previewGif?.url ?? gif.images.original!.webp!;
}
