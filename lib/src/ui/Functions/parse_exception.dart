import 'package:flutter/foundation.dart';
import 'package:flutter_giphy_picker/src/api/Exception/api_exception.dart';

String parseException(Exception? exception) {
  if (kDebugMode) {
    print(exception);
  }

  if (exception == null) {
    return 'No exception';
  }

  if (exception is ApiException) {
    return exception.toDisplay();
  }

  return exception.toString();
}
