import 'package:flutter/material.dart';

class RadioButtonField extends StatelessWidget {
  final String label;
  final String value;
  final String group;
  final ValueChanged<String> onChanged;
  const RadioButtonField({
    super.key,
    required this.label,
    required this.value,
    required this.group,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RadioListTile<String>(
      dense: true,
      contentPadding: EdgeInsets.zero,
      value: value,
      groupValue: group.isEmpty ? null : group,
      onChanged: (v) => onChanged(v ?? ''),
      title: Text(
        label,
        style: theme.textTheme.titleSmall?.copyWith(
          fontSize: 16,
          color: Colors.black87, // always readable
        ),
      ),
      visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
    );
  }
}
