part of './local_storage.dart';

Future<String> getRandomID(String apiKey) async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  final String? randomID = await localStorage.getRemoteID();

  if (randomID == null) {
    final result = await GiphyAPI.createRandomID(apiKey);

    localStorage.saveRemoteID(result.randomID);

    return result.randomID;
  }

  return randomID;
}

Future<void> saveGif(GifData gif) async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  List<String> favoriteGif = await localStorage.getFavoriteGifs();

  favoriteGif.add(gif.id);

  await localStorage.saveFavoriteGifs(favoriteGif);
}

Future<List<String>> getFavoriteGifs() async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  return localStorage.getFavoriteGifs();
}

Future<void> removeGif(GifData gif) async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  List<String> favoriteGif = await localStorage.getFavoriteGifs();

  favoriteGif.remove(gif.id);

  await localStorage.saveFavoriteGifs(favoriteGif);
}

Future<void> saveSticker(GifData sticker) async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  List<String> favoriteStickers = await localStorage.getFavoriteStickers();

  favoriteStickers.add(sticker.id);

  await localStorage.saveFavoriteStickers(favoriteStickers);
}

Future<List<String>> getFavoriteStickers() async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  return localStorage.getFavoriteStickers();
}

Future<void> removeSticker(GifData sticker) async {
  final _LocalStorage localStorage = await _LocalStorage.create();

  List<String> favoriteStickers = await localStorage.getFavoriteStickers();

  favoriteStickers.remove(sticker.id);

  await localStorage.saveFavoriteStickers(favoriteStickers);
}
