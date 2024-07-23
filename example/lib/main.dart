import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Giphy Test',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("fr"),
      ],
      locale: Locale("fr"),
      home: Scaffold(
        body: TestApp(),
      ),
    );
  }
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestApp();
}

class _TestApp extends State<TestApp> {
  GiphyResult? gifUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Flutter Giphy'),
      ),
      body: Column(
        children: [
          if (gifUrl != null)
            Center(
              child: Image.network(
                gifUrl!.url,
                fit: BoxFit.contain,
              ),
            ),
          Center(
            child: TextButton(
              onPressed: () async {
                final config = GiphyUIConfig(
                  apiKey: "YOUR_API_KEY",
                );

                final result = await showGiphyPicker(
                  context,
                  config,
                );

                setState(() {
                  gifUrl = result;
                });
              },
              child: const Text("Open giphy UI"),
            ),
          ),
        ],
      ),
    );
  }
}
