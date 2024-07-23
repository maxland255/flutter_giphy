/// Returns only renditions that correspond to the named bundle.
enum Bundle {
  /// If your use case is Mobile/Desktop Application with Grid/Carousel Picker for Clips Content Type
  clipsGridPicker,

  /// If your use case is Mobile/Desktop Application with Grid/Carousel Picker for Messaging using GIFs & Stickers
  messagingNonClips,

  /// If your use case is Mobile/Desktop Application with Grid/Carousel Picker for Sticker Layering in Photo/Video editing tools
  stickerLayering,

  /// If your use case is Mobile/Desktop Application with bandwidth limitations eg: MMS only allow assets less than 1MB
  lowBandwidth;

  String get apiValue {
    switch (this) {
      case Bundle.clipsGridPicker:
        return 'clips_grid_picker';
      case Bundle.messagingNonClips:
        return 'messaging_non_clips';
      case Bundle.stickerLayering:
        return 'sticker_layering';
      case Bundle.lowBandwidth:
        return 'low_bandwidth';
    }
  }
}
