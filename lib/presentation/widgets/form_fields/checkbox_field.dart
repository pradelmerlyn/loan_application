import 'package:flutter/material.dart';
import 'package:loan/presentation/widgets/form_fields/app_check_tile.dart';

class CheckboxField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final bool storeAsYesNo; // if true: saves "YES"/"NO"; else "true"/"false"
  final ValueChanged<bool>? onChanged;

  const CheckboxField({
    super.key,
    required this.ctrl,
    required this.label,
    this.storeAsYesNo = false,
    this.onChanged,
  });

  bool _parseBool(String text) {
    final t = text.trim().toLowerCase();
    return t == 'true' || t == 'yes' || t == '1';
  }

  String _boolToText(bool v) =>
      storeAsYesNo ? (v ? 'YES' : 'NO') : (v ? 'true' : 'false');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: ctrl,
      builder: (context, value, _) {
        final current = _parseBool(value.text);

        return AppCheckTile(
          value: current,
          label: label,
          onChanged: (nv) {
            final v = nv ?? false;
            ctrl.text = _boolToText(v);
            onChanged?.call(v);
          },
        );
      },
    );
  }
}
