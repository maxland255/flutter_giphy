import 'package:flutter/material.dart';
import 'package:flutter_giphy_picker/giphy_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Giphy Test',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("fr"),
      ],
      locale: const Locale("fr"),
      themeMode: themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Flutter Giphy'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (themeMode == ThemeMode.system) {
                    themeMode = ThemeMode.light;
                  } else if (themeMode == ThemeMode.light) {
                    themeMode = ThemeMode.dark;
                  } else {
                    themeMode = ThemeMode.system;
                  }
                });
              },
              child: const Text("ThemeMode"),
            ),
          ],
        ),
        body: const TestApp(),
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
    return Column(
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
                apiKey: "eXnQrseOgDHqDPRFmh5Y2QH2Ntf4mghO",
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
    );
  }
}
