import 'package:flutter/material.dart';

class SectionHeaderBar extends StatelessWidget {
  final String title;
  const SectionHeaderBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.14),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), // match outer container radius
          topRight: Radius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
