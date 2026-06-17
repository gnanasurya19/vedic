import 'package:vedic/core/theme/app_style.dart';
import 'package:flutter/material.dart';

extension StyleExtention on BuildContext {
  AppStyle get style => AppStyle(screenSize: MediaQuery.sizeOf(this));
}
