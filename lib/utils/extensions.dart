extension StringExtensions on String {
  String formatName() {
    if (length == 2) {
      return toUpperCase();
    }

    return split('-')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }
}
