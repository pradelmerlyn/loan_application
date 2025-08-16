import 'package:flutter/material.dart';

class FormValidators {
  const FormValidators._();
  static const FormValidators i = FormValidators._();

  /* ===================== Low-level helpers ===================== */

  String _digitsOnly(String v) => v.replaceAll(RegExp(r'\D'), '');

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

  double toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    if (t.isEmpty) return 0;
    return double.tryParse(t) ?? 0;
  }

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

  String? requiredField(String? value, {required String field}) {
    if ((value ?? '').trim().isEmpty) return '$field is required';
    return null;
  }

  /// Use in TextFormField.validator
  String? validatePhone(String? value,
      {String field = 'Phone Number', int minLen = 7}) {
    final req = requiredField(value, field: field);
    if (req != null) return req;

    final digits = _digitsOnly(value!);
    if (digits.length < minLen) return 'Enter a valid phone number';
    if (digits.length != 10) return 'Enter a 10-digit phone number';
    return null; // valid
  }

  /// Call this when you want to display `(XXX) XXX-XXXX`
  String formatPhone(String? value) {
    final digits = _digitsOnly(value ?? '');
    if (digits.length != 10) return value ?? '';
    final area = digits.substring(0, 3);
    final prefix = digits.substring(3, 6);
    final line = digits.substring(6);
    return '($area) $prefix-$line';
  }

  String? email(String? value, {String field = 'Email Address'}) {
    final req = requiredField(value, field: field);
    if (req != null) return req;

    final emailRegex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[A-Za-z]{2,}$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? zip(String? value,
      {String field = 'Zip Code', int min = 5, int max = 10}) {
    final t = (value ?? '').trim();
    if (t.isEmpty) return '$field is required';
    if (t.length < min || t.length > max) return 'Enter a valid zip code';
    return null;
  }

  // date helpers
  DateTime? dateFromTextCtrl(
    TextEditingController? controller, {
    DateTime? fallback,
  }) {
    final raw = controller?.text.trim();
    if (raw == null || raw.isEmpty) return fallback;
    return DateTime.tryParse(raw) ?? fallback;
  }

  DateTime? dateFromString(
    String? raw, {
    DateTime? fallback,
  }) {
    final txt = raw?.trim();
    if (txt == null || txt.isEmpty) return fallback;
    return DateTime.tryParse(txt) ?? fallback;
  }

  // boolean - dropdown 

  bool boolFromTextCtrl(
    TextEditingController? controller, {
    bool fallback = false,
  }) {
    final raw = controller?.text.trim().toLowerCase() ?? '';
    if (raw.isEmpty) return fallback;

    if (raw == 'true' || raw == 'yes' || raw == 'y' || raw == '1') {
      return true;
    }
    if (raw == 'false' || raw == 'no' || raw == 'n' || raw == '0') {
      return false;
    }
    return fallback;
  }
}
