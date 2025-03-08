extension StringExtensions on String {
  String formatName() {
    return split('-')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }
}
