import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';
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
    const v = FormValidators.i;
    return DropDownField<String>(
      label: 'What is the purpose of your loan?',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'Purchase', child: Text('Purchase')),
        DropdownMenuItem(value: 'Refinance', child: Text('Refinance')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (value) =>
          v.requiredField(value, field: 'Loan Purpose'),
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
    const v = FormValidators.i;
    return DropDownField<String>(
      label: 'What type of property are you looking for?',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'SingleFamily', child: Text('Single Family')),
        DropdownMenuItem(value: 'Condominium', child: Text('Condominium')),
        DropdownMenuItem(value: 'Cooperative', child: Text('Cooperative')),
        DropdownMenuItem(value: 'TwoToFourUnitProperty', child: Text('2-4 Unit')),
        DropdownMenuItem(value: 'ManufacturedHome', child: Text('Manufactured')),
        DropdownMenuItem(value: 'PlannedUnitDevelopment', child: Text('Planned Unit')),
        DropdownMenuItem(value: 'Land', child: Text('Land')),
        DropdownMenuItem(value: 'MultiFamily', child: Text('Multi-Family')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (value) => v.requiredField(value, field: 'Loan Purpose'),
    );
  }
}

class _NumberOfUnitsField extends StatelessWidget {
  final TextEditingController ctrl;
  const _NumberOfUnitsField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const v = FormValidators.i;
    return FormTextField(
      label: 'What is the number of units?',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      validator: (value) => v.requiredField(value, field: 'Number of Units'),
    );
  }
}

class _PropertyUsageField extends StatelessWidget {
  final TextEditingController ctrl;
  const _PropertyUsageField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const v = FormValidators.i;
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
      validator: (value) => v.requiredField(value, field: 'Property Usage'),
    );
  }
}

class _EstimatedDownPaymentField extends StatelessWidget {
  final TextEditingController ctrl;
  const _EstimatedDownPaymentField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const v = FormValidators.i;
    return FormTextField(
      label: 'What is your estimated down payment?',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9,.\$]')),
      ],
      onChanged: (_) {
        // only rewrite if the formatted text actually differs (avoid cursor jump loops)
        final amt = v.toAmount(ctrl.text);
        final formatted = v.fmtCurrency(amt);
        if (formatted != ctrl.text) {
          ctrl.value = ctrl.value.copyWith(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
            composing: TextRange.empty,
          );
        }
      },
      validator: (value) => v.requiredField(value, field: 'Estimated Down Payment'),
    );
  }
}
