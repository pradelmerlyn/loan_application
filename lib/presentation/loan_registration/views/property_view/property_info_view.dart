import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/toggle_switch.dart';

class PropertyInfoSection extends StatelessWidget {
  final PropertyInfoFormControllers ctrls;
  const PropertyInfoSection({super.key, required this.ctrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Property Information'),
          const SizedBox(height: 16),
          _LoanPurposeField(ctrl: ctrls.loanPurpose),
          const SizedBox(height: 16),
          _FoundHouseField(ctrl: ctrls.hasFoundHouse),
          const SizedBox(height: 16),
          _HoaField(ctrl: ctrls.isPartOfHoa),
          const SizedBox(height: 16),
          _PropertyTypeField(ctrl: ctrls.propertyType),
          const SizedBox(height: 16),
          _NumberOfUnitsField(ctrl: ctrls.numberOfUnits),
          const SizedBox(height: 16),
          _PropertyUsageField(ctrl: ctrls.intendedUsageType),
          const SizedBox(height: 16),
          _EstimatedDownPaymentField(ctrl: ctrls.estimatedDownPayment),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _LoanPurposeField extends StatelessWidget {
  final TextEditingController ctrl;
  const _LoanPurposeField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'What is the purpose of your loan?',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'Purchase', child: Text('Purchase')),
        DropdownMenuItem(value: 'Refinance', child: Text('Refinance')),
        DropdownMenuItem(
          value: 'Cash-Out Refinance',
          child: Text('Cash-Out Refinance'),
        ),
        DropdownMenuItem(value: 'Home Equity', child: Text('Home Equity')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) =>
          (v == null || v.isEmpty) ? 'Please select a loan purpose' : null,
    );
  }
}

class _FoundHouseField extends StatelessWidget {
  final TextEditingController ctrl; // stores YES/NO
  const _FoundHouseField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitchField(
      label: 'Have you found the house you want to buy?',
      controller: ctrl,
      trueLabel: 'YES',
      falseLabel: 'NO',
      storeAsYesNo: true,
    );
  }
}

class _HoaField extends StatelessWidget {
  final TextEditingController ctrl; // stores YES/NO
  const _HoaField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitchField(
      label: 'Is the property part of a homeowners association?',
      controller: ctrl,
      trueLabel: 'YES',
      falseLabel: 'NO',
      storeAsYesNo: true,
    );
  }
}

class _PropertyTypeField extends StatelessWidget {
  final TextEditingController ctrl;
  const _PropertyTypeField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'What type of property are you looking for?',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'Single-Family', child: Text('Single-Family')),
        DropdownMenuItem(value: 'Condo', child: Text('Condo')),
        DropdownMenuItem(value: 'Townhouse', child: Text('Townhouse')),
        DropdownMenuItem(value: '2-4 Unit', child: Text('2-4 Unit')),
        DropdownMenuItem(value: 'Manufactured', child: Text('Manufactured')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) =>
          (v == null || v.isEmpty) ? 'Please select a property type' : null,
    );
  }
}

class _NumberOfUnitsField extends StatelessWidget {
  final TextEditingController ctrl;
  const _NumberOfUnitsField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'What is the number of units?',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      validator: (v) {
        final t = (v ?? '').trim();
        if (t.isEmpty) return 'Please enter number of units';
        final n = int.tryParse(t);
        if (n == null || n < 1 || n > 99) return 'Enter a valid number (1–99)';
        return null;
      },
    );
  }
}

class _PropertyUsageField extends StatelessWidget {
  final TextEditingController ctrl;
  const _PropertyUsageField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'How will this property be used?',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(
          value: 'Primary Residence',
          child: Text('Primary Residence'),
        ),
        DropdownMenuItem(value: 'Second Home', child: Text('Second Home')),
        DropdownMenuItem(value: 'Investment', child: Text('Investment')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) => (v == null || v.isEmpty)
          ? 'Please select how the property will be used'
          : null,
    );
  }
}

class _EstimatedDownPaymentField extends StatelessWidget {
  final TextEditingController ctrl;
  const _EstimatedDownPaymentField({required this.ctrl});

  double _toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    if (t.isEmpty) return 0;
    return double.tryParse(t) ?? 0;
  }

  String _fmtCurrency(num v) {
    final s = v.toStringAsFixed(0);
    return '\$${s.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';
  }

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'What is your estimated down payment?',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9,.\$]')),
      ],
      onChanged: (_) {
        // only rewrite if the formatted text actually differs (avoid cursor jump loops)
        final amt = _toAmount(ctrl.text);
        final formatted = _fmtCurrency(amt);
        if (formatted != ctrl.text) {
          ctrl.value = ctrl.value.copyWith(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
            composing: TextRange.empty,
          );
        }
      },
      validator: (v) => ((v ?? '').replaceAll(RegExp(r'[^0-9]'), '').isEmpty)
          ? 'Please enter an amount'
          : null,
    );
  }
}
