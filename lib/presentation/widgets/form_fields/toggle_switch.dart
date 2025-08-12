import 'package:flutter/material.dart';

class ToggleSwitchField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<bool>? onChanged;
  final String trueLabel; // UI label
  final String falseLabel; // UI label
  final bool storeAsYesNo; // how to store in controller: YES/NO vs true/false
  final String? Function(bool value)? validator;

  const ToggleSwitchField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.trueLabel = 'YES',
    this.falseLabel = 'NO',
    this.storeAsYesNo = false, // set true if you want "YES"/"NO" in controller
    this.validator,
  });

  bool _parseBool(String text) {
    final t = text.trim().toLowerCase();
    return t == 'true' || t == 'yes' || t == '1';
  }

  String _boolToText(bool v) =>
      storeAsYesNo ? (v ? 'YES' : 'NO') : (v ? 'true' : 'false');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Rebuild when the controller changes
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final current = _parseBool(value.text);

        // Optional validation (works in or out of a Form)
        final error = validator?.call(current);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: error == null
                      ? Colors.grey.shade300
                      : theme.colorScheme.error,
                  width: error == null ? 1 : 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(label, 
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                          color: Colors.black87, // always readable
                        ),
                      )
                    ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: current
                          ? theme.colorScheme.primary.withValues(alpha: 0.15)
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Switch(
                          value: current,
                          onChanged: (v) {
                            controller.text = _boolToText(v);
                            onChanged?.call(v);
                          },
                          activeColor: theme.colorScheme.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          current ? trueLabel : falseLabel,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 6),
              Text(error,
                  style:
                      TextStyle(color: theme.colorScheme.error, fontSize: 12)),
            ],
          ],
        );
      },
    );
  }
}
