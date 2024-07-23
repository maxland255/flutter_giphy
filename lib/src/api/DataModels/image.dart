/// Data model for a GIF image.
///
/// This object contains various data points for a single GIF image.
class ImageData {
  /// Data on versions of this GIF with a fixed height of 200 pixels. Good for mobile use.
  final FixedImage? fixedHeight;

  /// Data on a static image of this GIF with a fixed height of 200 pixels.
  final StillImage? fixedHeightStill;

  /// Data on versions of this GIF with a fixed height of 200 pixels and the number of frames reduced to 6.
  final DownsampledImage? fixedHeightDownsampled;

  /// Data on versions of this GIF with a fixed width of 200 pixels. Good for mobile use.
  final FixedImage? fixedWidth;

  /// Data on a static image of this GIF with a fixed width of 200 pixels.
  final StillImage? fixedWidthStill;

  /// Data on versions of this GIF with a fixed width of 200 pixels and the number of frames reduced to 6.
  final DownsampledImage? fixedWidthDownsampled;

  /// Data on versions of this GIF with a fixed height of 100 pixels. Good for mobile keyboards.
  final FixedImage? fixedHeightSmall;

  /// Data on a static image of this GIF with a fixed height of 100 pixels.
  final StillImage? fixedHeightSmallStill;

  /// Data on versions of this GIF with a fixed width of 100 pixels. Good for mobile keyboards.
  final FixedImage? fixedWidthSmall;

  /// Data on a static image of this GIF with a fixed width of 100 pixels.
  final StillImage? fixedWidthSmallStill;

  /// Data on a version of this GIF downsized to be under 2mb.
  final DownsizedImage? downsized;

  /// Data on a static preview image of the downsized version of this GIF.
  final StillImage? downsizedStill;

  /// Data on a version of this GIF downsized to be under 8mb.
  final DownsizedImage? downsizedLarge;

  /// Data on a version of this GIF downsized to be under 5mb.
  final DownsizedImage? downsizedMedium;

  /// Data on a version of this GIF downsized to be under 200kb.
  final DownsizedSmallImage? downsizedSmall;

  /// Data on the original version of this GIF. Good for desktop use.
  final OriginalImage? original;

  /// Data on a static preview image of the original GIF.
  final StillImage? originalStill;

  /// Data on the 15 second version of the GIF looping.
  final LoopingImage? looping;

  /// Data on a version of this GIF in .MP4 format limited to 50kb that displays the first 1-2 seconds of the GIF.
  final PreviewImage? preview;

  /// Data on a version of this GIF limited to 50kb that displays the first 1-2 seconds of the GIF.
  final PreviewGif? previewGif;

  /// Data on a version of this GIF in .webp format.
  final DownsizedImage? previewWebp;

  ImageData({
    required this.fixedHeight,
    required this.fixedHeightStill,
    required this.fixedHeightDownsampled,
    required this.fixedWidth,
    required this.fixedWidthStill,
    required this.fixedWidthDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.downsized,
    required this.downsizedStill,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.original,
    required this.originalStill,
    required this.looping,
    required this.preview,
    required this.previewGif,
    required this.previewWebp,
  });

  ImageData.fromJson(Map<String, dynamic> json)
      : this(
          fixedHeight:
              json['fixed_height'] == null || json['fixed_height'].keys.isEmpty
                  ? null
                  : FixedImage.fromJson(json['fixed_height']),
          fixedHeightStill: json['fixed_height_still'] == null ||
                  json['fixed_height_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['fixed_height_still']),
          fixedHeightDownsampled: json['fixed_height_downsampled'] == null ||
                  json['fixed_height_downsampled'].keys.isEmpty
              ? null
              : DownsampledImage.fromJson(json['fixed_height_downsampled']),
          fixedWidth:
              json['fixed_width'] == null || json['fixed_width'].keys.isEmpty
                  ? null
                  : FixedImage.fromJson(json['fixed_width']),
          fixedWidthStill: json['fixed_width_still'] == null ||
                  json['fixed_width_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['fixed_width_still']),
          fixedWidthDownsampled: json['fixed_width_downsampled'] == null ||
                  json['fixed_width_downsampled'].keys.isEmpty
              ? null
              : DownsampledImage.fromJson(json['fixed_width_downsampled']),
          fixedHeightSmall: json['fixed_height_small'] == null ||
                  json['fixed_height_small'].keys.isEmpty
              ? null
              : FixedImage.fromJson(json['fixed_height_small']),
          fixedHeightSmallStill: json['fixed_height_small_still'] == null ||
                  json['fixed_height_small_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['fixed_height_small_still']),
          fixedWidthSmall: json['fixed_width_small'] == null ||
                  json['fixed_width_small'].keys.isEmpty
              ? null
              : FixedImage.fromJson(json['fixed_width_small']),
          fixedWidthSmallStill: json['fixed_width_small_still'] == null ||
                  json['fixed_width_small_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['fixed_width_small_still']),
          downsized: json['downsized'] == null || json['downsized'].keys.isEmpty
              ? null
              : DownsizedImage.fromJson(json['downsized']),
          downsizedStill: json['downsized_still'] == null ||
                  json['downsized_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['downsized_still']),
          downsizedLarge: json['downsized_large'] == null ||
                  json['downsized_large'].keys.isEmpty
              ? null
              : DownsizedImage.fromJson(json['downsized_large']),
          downsizedMedium: json['downsized_medium'] == null ||
                  json['downsized_medium'].keys.isEmpty
              ? null
              : DownsizedImage.fromJson(json['downsized_medium']),
          downsizedSmall: json['downsized_small'] == null ||
                  json['downsized_small'].keys.isEmpty
              ? null
              : DownsizedSmallImage.fromJson(json['downsized_small']),
          original: json['original'] == null || json['original'].keys.isEmpty
              ? null
              : OriginalImage.fromJson(json['original']),
          originalStill: json['original_still'] == null ||
                  json['original_still'].keys.isEmpty
              ? null
              : StillImage.fromJson(json['original_still']),
          looping: json['looping'] == null || json['looping'].keys.isEmpty
              ? null
              : LoopingImage.fromJson(json['looping']),
          preview: json['preview'] == null || json['preview'].keys.isEmpty
              ? null
              : PreviewImage.fromJson(json['preview']),
          previewGif:
              json['preview_gif'] == null || json['preview_gif'].keys.isEmpty
                  ? null
                  : PreviewGif.fromJson(json['preview_gif']),
          previewWebp:
              json['preview_webp'] == null || json['preview_webp'].keys.isEmpty
                  ? null
                  : DownsizedImage.fromJson(json['preview_webp']),
        );
}

class FixedImage {
  /// The publicly-accessible direct URL for this GIF.
  final String url;

  /// The publicly-accessible direct URL for this GIF.
  Uri get uri => Uri.parse(url);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  /// The size of this GIF in bytes.
  final String size;

  /// The URL for this GIF in .MP4 format.
  final String? mp4;

  /// The URL for this GIF in .MP4 format.
  Uri? get mp4Uri => mp4 == null ? null : Uri.parse(mp4!);

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  final String? mp4Size;

  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The URL for this GIF in .webp format.
  Uri? get webpUri => webp == null ? null : Uri.parse(webp!);

  /// The URL for this GIF in .webp format.
  final String? webpSize;

  FixedImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.mp4,
    required this.mp4Size,
    required this.webp,
    required this.webpSize,
  });

  FixedImage.fromJson(Map<String, dynamic> json)
      : this(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'],
          mp4: json['mp4'],
          mp4Size: json['mp4_size'],
          webp: json['webp'],
          webpSize: json['webp_size'],
        );
}

class StillImage {
  /// The publicly-accessible direct URL for this GIF.
  final String url;

  /// The publicly-accessible direct URL for this GIF.
  Uri get uri => Uri.parse(url);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  StillImage({
    required this.url,
    required this.width,
    required this.height,
  });

  StillImage.fromJson(Map<String, dynamic> json)
      : this(
          url: json['url'],
          width: json['width'],
          height: json['height'],
        );
}

class DownsampledImage {
  /// The publicly-accessible direct URL for this GIF.
  final String url;

  /// The publicly-accessible direct URL for this GIF.
  Uri get uri => Uri.parse(url);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  /// The size of this GIF in bytes.
  final String size;

  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The URL for this GIF in .webp format.
  Uri? get webpUri => webp == null ? null : Uri.parse(webp!);

  /// The size in bytes of the .webp file corresponding to this GIF.
  final String? webpSize;

  DownsampledImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.webp,
    required this.webpSize,
  });

  DownsampledImage.fromJson(Map<String, dynamic> json)
      : this(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'],
          webp: json['webp'],
          webpSize: json['webp_size'],
        );
}

class DownsizedImage {
  /// The publicly-accessible direct URL for this GIF.
  final String url;

  /// The publicly-accessible direct URL for this GIF.
  Uri get uri => Uri.parse(url);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  /// The size of this GIF in bytes.
  final String size;

  DownsizedImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });

  DownsizedImage.fromJson(Map<String, dynamic> json)
      : this(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'],
        );
}

class DownsizedSmallImage {
  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The URL for this GIF in .MP4 format.
  Uri get mp4Uri => Uri.parse(mp4);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  final String mp4Size;

  DownsizedSmallImage({
    required this.mp4,
    required this.width,
    required this.height,
    required this.mp4Size,
  });

  DownsizedSmallImage.fromJson(Map<String, dynamic> json)
      : this(
          mp4: json['mp4'],
          width: json['width'],
          height: json['height'],
          mp4Size: json['mp4_size'],
        );
}

class OriginalImage {
  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  /// The size of this GIF in bytes.
  final String size;

  /// The number of frames in this GIF.
  final String frames;

  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The URL for this GIF in .MP4 format.
  Uri get mp4Uri => Uri.parse(mp4);

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  final String mp4Size;

  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The URL for this GIF in .webp format.
  Uri? get webpUri => webp == null ? null : Uri.parse(webp!);

  /// The size in bytes of the .webp file corresponding to this GIF.
  final String? webpSize;

  OriginalImage({
    required this.width,
    required this.height,
    required this.size,
    required this.frames,
    required this.mp4,
    required this.mp4Size,
    required this.webp,
    required this.webpSize,
  });

  OriginalImage.fromJson(Map<String, dynamic> json)
      : this(
          width: json['width'],
          height: json['height'],
          size: json['size'],
          frames: json['frames'],
          mp4: json['mp4'],
          mp4Size: json['mp4_size'],
          webp: json['webp'],
          webpSize: json['webp_size'],
        );
}

class LoopingImage {
  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The URL for this GIF in .MP4 format.
  Uri get mp4Uri => Uri.parse(mp4);

  LoopingImage({
    required this.mp4,
  });

  LoopingImage.fromJson(Map<String, dynamic> json)
      : this(
          mp4: json['mp4'],
        );
}

class PreviewImage {
  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The URL for this GIF in .MP4 format.
  Uri get mp4Uri => Uri.parse(mp4);

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  final String mp4Size;

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  PreviewImage({
    required this.mp4,
    required this.mp4Size,
    required this.width,
    required this.height,
  });

  PreviewImage.fromJson(Map<String, dynamic> json)
      : this(
          mp4: json['mp4'],
          mp4Size: json['mp4_size'],
          width: json['width'],
          height: json['height'],
        );
}

class PreviewGif {
  /// The URL for this preview GIF.
  final String url;

  /// The URL for this preview GIF.
  Uri get uri => Uri.parse(url);

  /// The width of this GIF in pixels.
  final String width;

  /// The height of this GIF in pixels.
  final String height;

  PreviewGif({
    required this.url,
    required this.width,
    required this.height,
  });

  PreviewGif.fromJson(Map<String, dynamic> json)
      : this(
          url: json['url'],
          width: json['width'],
          height: json['height'],
        );
}
