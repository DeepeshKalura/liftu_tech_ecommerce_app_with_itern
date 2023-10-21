class GlobalColors {
  static const int red = 0xFFD2606D;
  static const int yellow = 0xFFF4BC66;
  static const int white = 0xFFF8E4DD;
  static const int orange = 0xFFE07A5F;
  static const int grey = 0xFF717C84;
  static const int green = 0xFF81B29A;

  static int randomColor(int index) {
    final colors = [red, yellow, orange, grey, green];
    return colors[index % colors.length];
  }
}
