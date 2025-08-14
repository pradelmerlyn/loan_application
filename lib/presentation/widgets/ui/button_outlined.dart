import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final double? width;
  final bool useFullWidth;
  final Widget? leading;
  final Widget? trailing;

  const ButtonOutlined({
    super.key,
    required this.label,
    this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.width,
    this.useFullWidth = true,
    this.leading,
    this.trailing, // ✅ Added
  });

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        textStyle: const TextStyle(fontSize: 16),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 8),
          ],
          Text(label),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
    );

    if (width != null) {
      return SizedBox(width: width, child: button);
    } else if (useFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    } else {
      return button;
    }
  }
}
