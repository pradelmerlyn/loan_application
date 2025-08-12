
import 'package:flutter/services.dart';

/// Currency formatter with optional decimals (max 2 digits after decimal)
class CurrencyFormatter extends TextInputFormatter {
  const CurrencyFormatter();

  String _format(String digits) {
    if (digits.isEmpty) return '';
    // remove leading zeros
    digits = digits.replaceFirst(RegExp(r'^0+'), '');
    if (digits.isEmpty) return '\$0';
    final buf = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      final revIdx = digits.length - i - 1;
      buf.write(digits[i]);
      final remaining = revIdx;
      if (remaining % 3 == 0 && remaining != 0) buf.write(',');
    }
    return '\$${buf.toString()}';
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // raw digits from the NEW value
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final formatted = _format(digits);

    // compute new cursor position (at end)
    final sel = TextSelection.collapsed(offset: formatted.length);
    return TextEditingValue(text: formatted, selection: sel);
  }
}
