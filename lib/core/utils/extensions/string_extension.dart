extension StringExtension on String {
  /// Returns a new string with the first [length] characters of this string.
  String limit(int length) =>
      length < this.length ? substring(0, length) : this;

  String get toPath => '/$this';

  String get capitalize {
    return substring(0, 1).toUpperCase() + substring(1);
  }

  String get toTitleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }
}
