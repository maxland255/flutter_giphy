## flutter_giphy Package

This Flutter package provides two main functionalities:

1. **Direct Communication with Giphy API**: Easily interact with the Giphy API to search for GIFs, stickers, and emojis, retrieve trending items, and more. This part of the package abstracts the complexities of the API, offering simple and intuitive methods for making requests and handling responses.

2. **Comprehensive GIF Picker**: A fully-featured widget for picking GIFs, stickers, and emojis. The picker integrates seamlessly with the Giphy API, allowing users to browse and select from a wide range of media types. The picker includes built-in search functionality, pagination, and loading indicators to ensure a smooth user experience.

### Features
- **Giphy API Integration**: Direct methods to interact with Giphy’s extensive database of GIFs, stickers, and emojis.
- **GIF Picker Widget**: A ready-to-use widget for browsing and selecting GIFs, stickers, and emojis, with integrated search and pagination.
- **Loading Indicators**: Display loading indicators while fetching data or loading images.
- **Error Handling**: Graceful error handling to manage failed API requests and image loading errors.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_giphy/giphy_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Giphy Test',
      home: Scaffold(
        body: TestApp(),
      ),
    );
  }
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
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

                // Highlighted call to showGiphyPicker
                final result = await showGiphyPicker(context, config);

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
```

### Installation
Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_giphy_picker: ^1.0.2
```

### Usage
1. **Giphy Picker**: Call the `showGiphyPicker` function to open a comprehensive GIF picker interface.

Here’s a simple example to show a GIF:

```dart
Image.network(
    gifUrl!.url,
    fit: BoxFit.contain,
),
```