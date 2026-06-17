import 'package:flutter/material.dart';

class AppStyle {
  final double scale;
  final _AppText text;
  final _Insets insets;
  final _IconSize icon;
  final _Radius radius;

  AppStyle._(this.scale)
    : text = _AppText(scale),
      insets = _Insets(scale),
      icon = _IconSize(scale),
      radius = _Radius(scale);

  factory AppStyle({Size? screenSize}) {
    if (screenSize == null) return AppStyle._(1.0);

    final currentScreen = screenSize.shortestSide;
    double determinedScale;

    if (currentScreen > 1024) {
      determinedScale = 1.22;
    } else if (currentScreen > 768) {
      determinedScale = 1.17;
    } else if (currentScreen > 600) {
      determinedScale = 1.11;
    } else if (currentScreen > 480) {
      determinedScale = 1.03;
    } else if (currentScreen > 412) {
      determinedScale = 1.0;
    } else if (currentScreen > 360) {
      determinedScale = 0.9;
    } else {
      determinedScale = 0.85;
    }

    return AppStyle._(determinedScale);
  }
}

class _AppText {
  final double scale;
  _AppText(this.scale);

  TextStyle _baseTextStyle(double size, FontWeight weight) {
    return TextStyle(fontSize: size * scale, fontWeight: weight);
  }

  late final TextStyle regularXXS = _baseTextStyle(8, FontWeight.w400);
  late final TextStyle regularXS = _baseTextStyle(10, FontWeight.w400);
  late final TextStyle regularSmall = _baseTextStyle(12, FontWeight.w400);
  late final TextStyle regular = _baseTextStyle(14, FontWeight.w400);
  late final TextStyle regularMedium = _baseTextStyle(16, FontWeight.w400);
  late final TextStyle regularMd = _baseTextStyle(18, FontWeight.w400);
  late final TextStyle regularLarge = _baseTextStyle(20, FontWeight.w400);
  late final TextStyle regularXLarge = _baseTextStyle(23, FontWeight.w400);
  late final TextStyle regularXXLarge = _baseTextStyle(26, FontWeight.w400);

  late final TextStyle semiBoldXXS = _baseTextStyle(8, FontWeight.w600);
  late final TextStyle semiBoldXS = _baseTextStyle(10, FontWeight.w600);
  late final TextStyle semiBoldSmall = _baseTextStyle(12, FontWeight.w600);
  late final TextStyle semiBold = _baseTextStyle(14, FontWeight.w600);
  late final TextStyle semiBoldMedium = _baseTextStyle(16, FontWeight.w600);
  late final TextStyle semiBoldMd = _baseTextStyle(18, FontWeight.w600);
  late final TextStyle semiBoldLarge = _baseTextStyle(20, FontWeight.w600);
  late final TextStyle semiBoldXLarge = _baseTextStyle(23, FontWeight.w600);
  late final TextStyle semiBoldXXLarge = _baseTextStyle(26, FontWeight.w600);

  late final TextStyle boldXXS = _baseTextStyle(8, FontWeight.w700);
  late final TextStyle boldXS = _baseTextStyle(10, FontWeight.w700);
  late final TextStyle boldSmall = _baseTextStyle(12, FontWeight.w700);
  late final TextStyle bold = _baseTextStyle(14, FontWeight.w700);
  late final TextStyle boldMedium = _baseTextStyle(16, FontWeight.w700);
  late final TextStyle boldMd = _baseTextStyle(18, FontWeight.w700);
  late final TextStyle boldLarge = _baseTextStyle(20, FontWeight.w700);
  late final TextStyle boldXLarge = _baseTextStyle(23, FontWeight.w700);
  late final TextStyle boldXXLarge = _baseTextStyle(26, FontWeight.w700);
}

class _Insets {
  final double scale;
  _Insets(this.scale);

  late final double xxs = 2.5 * scale;
  late final double xs = 5 * scale;
  late final double sm = 8 * scale;
  late final double md = 12 * scale;
  late final double rg = 14 * scale;
  late final double lg = 18 * scale;
  late final double xl = 22 * scale;
  late final double xxl = 40 * scale;
}

class _IconSize {
  final double scale;
  _IconSize(this.scale);

  late final double xxs = 12 * scale;
  late final double xs = 15 * scale;
  late final double sm = 20 * scale;
  late final double rg = 25 * scale;
  late final double md = 35 * scale;
  late final double lg = 40 * scale;
  late final double xl = 60 * scale;
}

class _Radius {
  final double scale;
  _Radius(this.scale);

  late final double xs = 5 * scale;
  late final double sm = 8 * scale;
  late final double md = 12 * scale;
  late final double lg = 16 * scale;
  late final double xl = 20 * scale;
  late final double xxl = 35 * scale;
}
