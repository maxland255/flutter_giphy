extension IntExtension on int {
  bool get isInt32 {
    return this >= -2147483648 && this <= 2147483647;
  }

  bool get isUint32 {
    return this >= 0 && this <= 4294967295;
  }
}
