// validators/borrower_view_validators.dart
import 'package:flutter/foundation.dart';

class BorrowerViewValidators {
  const BorrowerViewValidators._();

  static const BorrowerViewValidators i = BorrowerViewValidators._();

  /* ===================== Low-level helpers ===================== */

  String _digitsOnly(String v) => v.replaceAll(RegExp(r'[^0-9]'), '');

  String _formatSsn(String raw) {
    final d = _digitsOnly(raw);
    if (d.isEmpty) return '';
    final b1 = d.substring(0, d.length.clamp(0, 3));
    final b2 = d.length <= 3 ? '' : d.substring(3, d.length.clamp(3, 5));
    final b3 = d.length <= 5 ? '' : d.substring(5);
    return [b1, if (d.length > 3) b2, if (d.length > 5) b3].join('-');
  }

  String _maskSsn(String raw) {
    final d = _digitsOnly(raw);
    if (d.isEmpty) return '';
    final last4 = d.length <= 4 ? d : d.substring(d.length - 4);
    return d.length <= 4 ? last4 : '***-**-$last4';
  }


  String ssnDisplay(String raw, {required bool obscure}) =>
      obscure ? _maskSsn(raw) : _formatSsn(raw);

  String formatDate(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    final yy = d.year.toString();
    return '$mm/$dd/$yy';
  }

  /// Parse currency-like input (allows $, commas, dots). Returns 0 on empty/invalid.
  double toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    if (t.isEmpty) return 0;
    return double.tryParse(t) ?? 0;
  }

  /// Format currency with optional decimals (defaults to 0). Example: `$12,345` or `$12,345.67`
  String fmtCurrency(num v, {int decimals = 0}) {
    final str = v.toStringAsFixed(decimals);
    final parts = str.split('.');
    final whole = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return parts.length == 2 && decimals > 0
        ? '\$$whole.${parts[1]}'
        : '\$$whole';
  }

  bool asBool(String s) {
    final t = s.trim().toLowerCase();
    return t == 'true' || t == 'yes' || t == '1';
  }

  /* ===================== Validators ===================== */

  /// Generic required validator
  String? requiredField(String? value, {required String field}) {
    if (value == null || value.trim().isEmpty) return '$field is required';
    return null;
  }

  /// Phone validator (minLen default 7)
  String? phone(String? value,
      {String field = 'Phone Number', int minLen = 7}) {
    final req = requiredField(value, field: field);
    if (req != null) return req;
    final d = _digitsOnly(value ?? '');
    if (d.length < minLen) return 'Enter a valid phone number';
    return null;
  }

  /// Email validator (simple practical regex)
  String? email(String? value, {String field = 'Email Address'}) {
    final req = requiredField(value, field: field);
    if (req != null) return req;

    final emailRegex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[A-Za-z]{2,}$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// ZIP validator (default 5–10; supports ZIP+4 if desired)
  String? zip(String? value,
      {String field = 'Zip Code', int min = 5, int max = 10}) {
    final t = (value ?? '').trim();
    if (t.isEmpty) return '$field is required';
    if (t.length < min || t.length > max) return 'Enter a valid zip code';
    return null;
  }
}
