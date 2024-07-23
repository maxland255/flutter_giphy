extension StringExtension on String {
  String toCapitalize() {
    if (isEmpty) {
      return this;
    }

    return split(' ').map((word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
