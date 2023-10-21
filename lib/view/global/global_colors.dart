class GlobalColors {
  static const int red = 0xFFD2606D;
  static const int yellow = 0xFFF4BC66;
  // static const int white = 0xFFF8E4DD;
  static const int blueGrey = 0xFF6F8485;
  static const int grey = 0xFF545D63;

  static int randomColor(int index) {
    final colors = [red, yellow, blueGrey, grey];
    return colors[index % colors.length];
  }
}