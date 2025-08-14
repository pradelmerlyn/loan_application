import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final Color titleColor;
  final double borderRadius;

  const GlobalAppbar({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.backgroundColor = const Color(0xFF2E43DA),
    this.titleColor = Colors.white,
    this.borderRadius = 8.0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.titleSmall;
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderRadius),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: titleColor),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: textStyle
      ),
      bottom: subtitle != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(24),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  subtitle!,
                  style: TextStyle(
                    color: titleColor.withOpacity(0.92),
                    fontSize: 12.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
