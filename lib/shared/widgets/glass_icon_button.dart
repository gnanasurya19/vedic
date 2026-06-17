import 'package:flutter/material.dart';
import 'package:vedic/core/extentions/style_extention.dart';
import 'package:vedic/core/theme/app_colors.dart';

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
  const GlassIconButton({
    super.key, required this.icon, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.white.withValues(
          alpha: 0.4,
        ),
        foregroundColor: AppColors.white,
      ),
      onPressed: onPress,
      icon: Icon(icon,size: context.style.icon.sm,),
    );
  }
}
