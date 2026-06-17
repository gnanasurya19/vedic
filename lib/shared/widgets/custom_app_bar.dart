import 'package:flutter/material.dart';
import 'package:vedic/core/theme/app_colors.dart';
import 'package:vedic/shared/widgets/glass_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final bool isLeading;
  final Function()? onPressLeading;
  final double height;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.actions,
    required this.isLeading,
     this.onPressLeading, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: AppColors.primary,
      leadingWidth: MediaQuery.sizeOf(context).width * 0.15,
      leading: isLeading ? Center(
        child: GlassIconButton(icon: Icons.arrow_back_sharp, onPress: onPressLeading??(){}),
      ) :null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
