import 'package:flutter/foundation.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_giphy_picker/giphy_api.dart';

void main() {
  String apiKey = "YOUR_API_KEY";

  group(
    "Giphy api",
    () {
      test(
        "Get trending",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.getTrending(
            rating: Rating.g,
            bundle: Bundle.messagingNonClips,
          );

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Search gifs",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.search(
            "cheeseburgers",
            rating: Rating.g,
            bundle: Bundle.messagingNonClips,
          );

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Translate gifs",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.translate(
            "ryan gosling",
            rating: Rating.g,
          );

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Emoji",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.emoji();

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Emoji Variation",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.emojiVariation("dalJ0CpF7hwmN1nZXe");

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Get gif by ID",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.getGifByID("z4fEQYJOQj4LPJUcoS");

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Get Multiple gif by ID",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.getMultipleGifsByID([
            "z4fEQYJOQj4LPJUcoS",
            "33zX3zllJBGY8",
            "I6bnF1KUvMupa",
          ]);

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Get categories",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.categories();

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "AutoComplete Tag Term",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.autoComplete("foo");

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Channel search",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.channelSearch("foo");

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Search suggestions",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.termSearch("haha");

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );

      test(
        "Trending search terms",
        () async {
          final giphy = GiphyAPI(apiKey: apiKey);

          final response = await giphy.trendingSearch();

          if (kDebugMode) {
            print(response);
          }

          expect(response.meta.status, 200);
        },
      );
    },
  );
}
