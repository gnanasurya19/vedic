import 'dart:ui';

import 'package:intl/intl.dart';

class AppUtils {
  static const List<Color> _initialsColors = [
    Color(0xFFE57373), // soft red
    Color(0xFF81C784), // soft green
    Color(0xFF64B5F6), // soft blue
    Color(0xFFFFB74D), // soft orange
    Color(0xFFBA68C8), // soft purple
    Color(0xFF4DB6AC), // soft teal
    Color(0xFFF06292), // soft pink
    Color(0xFF4DD0E1), // soft cyan
    Color(0xFFDCE775), // soft lime
    Color(0xFFA1887F), // soft brown
  ];

  static Color getInitialColor(String name) {
    final index = name.trim().codeUnitAt(0) % _initialsColors.length;
    return _initialsColors[index];
  }

  static String getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    if (words.length == 1) return words[0][0].toUpperCase();
    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  static String formatDateTime(String isoString) {
    final dt = DateTime.parse(isoString);
    return DateFormat('dd MMM yyyy - hh:mm a').format(dt);
  }

  static String formatPrice(num price) {
    final String p = price.toStringAsFixed(0);
    if (p.length <= 3) return '₹$p';

    final String lastThree = p.substring(p.length - 3);
    final String rest = p.substring(0, p.length - 3);
    final String formatted = rest.replaceAllMapped(
      RegExp(r'\B(?=(\d{2})+(?!\d))'),
      (m) => ',',
    );
    return '₹$formatted,$lastThree';
  }
}
