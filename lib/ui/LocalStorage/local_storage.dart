import 'package:flutter_giphy_picker/giphy_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './local_storage_impl.dart';

class _LocalStorage {
  late final SharedPreferences _prefs;

  _LocalStorage._();

  static Future<_LocalStorage> create() async {
    final instance = _LocalStorage._();

    try {
      SharedPreferences.setPrefix("giphy_");
    } catch (_) {}

    instance._prefs = await SharedPreferences.getInstance();
    return instance;
  }

  Future<void> saveRemoteID(String remoteID) async {
    await _prefs.setString("remoteID", remoteID);
  }

  Future<String?> getRemoteID() async {
    return _prefs.getString("remoteID");
  }

  Future<void> removeRemoteID() async {
    await _prefs.remove("remoteID");
  }

  Future<void> saveFavoriteGifs(List<String> gifIDs) async {
    await _prefs.setStringList("favoriteGifs", gifIDs);
  }

  Future<List<String>> getFavoriteGifs() async {
    return _prefs.getStringList("favoriteGifs") ?? [];
  }

  Future<void> removeFavoriteGifs() async {
    await _prefs.remove("favoriteGifs");
  }

  Future<void> saveFavoriteStickers(List<String> stickerIDs) async {
    await _prefs.setStringList("favoriteStickers", stickerIDs);
  }

  Future<List<String>> getFavoriteStickers() async {
    return _prefs.getStringList("favoriteStickers") ?? [];
  }

  Future<void> removeFavoriteStickers() async {
    await _prefs.remove("favoriteStickers");
  }
}
