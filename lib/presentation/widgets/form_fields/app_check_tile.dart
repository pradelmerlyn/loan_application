
import 'package:flutter/material.dart';

class AppCheckTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const AppCheckTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const brandBlue = Color(0xFF2E43DA);
    const borderColor = Color.fromRGBO(0, 0, 0, 0.30);

    Color fill(Set<WidgetState> s) =>
        s.contains(WidgetState.selected) ? brandBlue : Colors.white;

    Color check(Set<WidgetState> s) =>
        s.contains(WidgetState.selected) ? Colors.white : Colors.transparent;

    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith(fill),
          checkColor: WidgetStateProperty.resolveWith(check),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: const BorderSide(color: borderColor, width: 1.4), 
          visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
        ),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        dense: true,
        visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            fontSize: 16,
            color: Colors.black87, // always readable
          ),
        ),
      ),
    );
  }
}
