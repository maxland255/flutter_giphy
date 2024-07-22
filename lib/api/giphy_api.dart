import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_giphy_picker/api/Exception/api_exception.dart';
import 'package:http/http.dart' as http;

class GiphyApiManager {
  static Future<Map<String, dynamic>> get(
    String baseUrl,
    List<String> pathSegments, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // Create the URL
    final url = Uri.https(baseUrl, pathSegments.join(''), queryParameters);

    // Make the request

    try {
      final http.Response response = await http.get(
        url,
        headers: headers,
      );

      // Parse the response

      final Map<String, dynamic> responseMap = jsonDecode(response.body);

      // Check if the response is an error

      if (response.statusCode != 200) {
        throw ApiException(
          _parseStatusCode(response.statusCode) ?? responseMap["meta"]["msg"],
          response.statusCode,
        );
      }

      return responseMap;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      if (kDebugMode) {
        print(e);
      }

      throw ApiException(
        e.toString(),
        null,
        error: e,
      );
    }
  }

  static String? _parseStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Your request was formatted incorrectly or missing a required parameter(s).';
      case 401:
        return "Your request lacks valid authentication credentials for the target resource, which most likely indicates an issue with your API Key or the API Key is missing.";
      case 403:
        return "You weren't authorized to make your request; most likely this indicates an issue with your API Key.";
      case 404:
        return "The particular GIF or Sticker you are requesting was not found. This occurs, for example, if you request a GIF by using an id that does not exist.";
      case 414:
        return "The length of the search query exceeds 50 characters.";
      case 429:
        return "Your API Key is making too many requests. Read about requesting a Production Key to upgrade your API Key rate limits.";
      default:
        return null;
    }
  }

  static Future<bool> getUri(String url, String randomID) async {
    final Uri uri = Uri.parse(url);

    Map<String, String> newQueryParameters = Map.from(uri.queryParameters);

    newQueryParameters["ts"] = DateTime.now().millisecondsSinceEpoch.toString();
    newQueryParameters["random_id"] = randomID;

    final newUri = uri.replace(queryParameters: newQueryParameters);

    final http.Response response = await http.get(
      newUri,
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
