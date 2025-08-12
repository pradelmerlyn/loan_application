import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';

class PropertyAddressSection extends StatelessWidget {
  final PropertyInfoFormControllers ctrls;
  const PropertyAddressSection({super.key, required this.ctrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Property Address'),
          const SizedBox(height: 16),
          _YearBuiltField(ctrl: ctrls.yearBuiltCtrl),
          const SizedBox(height: 16),
          _AddressLine1Field(ctrl: ctrls.propAddressLine1Ctrl),
          const SizedBox(height: 16),
          _AptAndCityRow(
            aptCtrl: ctrls.propUnitNoCtrl,
            cityCtrl: ctrls.propCityCtrl,
          ),
          const SizedBox(height: 16),
          _CountyAndStateRow(
            countyCtrl: ctrls.propCountyCtrl,
            stateCtrl: ctrls.propStateCtrl,
          ),
          const SizedBox(height: 16),
          _ZipRow(zipCtrl: ctrls.propZipCodeCtrl),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _YearBuiltField extends StatelessWidget {
  final TextEditingController ctrl;
  const _YearBuiltField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'What year was the property built?',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      validator: (v) {
        final t = (v ?? '').trim();
        if (t.isEmpty) return 'Year built is required';
        final y = int.tryParse(t);
        final now = DateTime.now().year;
        if (y == null || y < 1800 || y > now)
          return 'Enter a valid year (1800–$now)';
        return null;
      },
    );
  }
}

class _AddressLine1Field extends StatelessWidget {
  final TextEditingController ctrl;
  const _AddressLine1Field({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'Address Line 1',
      controller: ctrl,
      validator: (v) =>
          (v ?? '').trim().isEmpty ? 'Address Line 1 is required' : null,
    );
  }
}

class _AptAndCityRow extends StatelessWidget {
  final TextEditingController aptCtrl;
  final TextEditingController cityCtrl;
  const _AptAndCityRow({required this.aptCtrl, required this.cityCtrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormTextField(label: 'Apt/Unit/Suite', controller: aptCtrl),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FormTextField(
            label: 'City',
            controller: cityCtrl,
            textCapitalization: TextCapitalization.words,
            validator: (v) =>
                (v ?? '').trim().isEmpty ? 'City is required' : null,
          ),
        ),
      ],
    );
  }
}

class _CountyAndStateRow extends StatelessWidget {
  final TextEditingController countyCtrl;
  final TextEditingController stateCtrl;
  const _CountyAndStateRow({required this.countyCtrl, required this.stateCtrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormTextField(
            label: 'County',
            controller: countyCtrl,
            textCapitalization: TextCapitalization.words,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropDownField<String>(
            label: 'State',
            value: stateCtrl.text.isEmpty ? null : stateCtrl.text,
            items: const [
              DropdownMenuItem(value: 'Alabama', child: Text('Alabama')),
              DropdownMenuItem(value: 'Alaska', child: Text('Alaska')),
              DropdownMenuItem(value: 'Arizona', child: Text('Arizona')),
              DropdownMenuItem(value: 'California', child: Text('California')),
              DropdownMenuItem(value: 'Florida', child: Text('Florida')),
              DropdownMenuItem(value: 'New York', child: Text('New York')),
              DropdownMenuItem(value: 'Texas', child: Text('Texas')),
            ],
            onChanged: (v) => stateCtrl.text = v ?? '',
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Please select a state' : null,
          ),
        ),
      ],
    );
  }
}

class _ZipRow extends StatelessWidget {
  final TextEditingController zipCtrl;
  const _ZipRow({required this.zipCtrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormTextField(
            label: 'Zip Code',
            controller: zipCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5), // 5-digit ZIP
            ],
            validator: (v) {
              final t = (v ?? '').trim();
              if (t.isEmpty) return 'Zip Code is required';
              if (t.length != 5) return 'Enter a 5-digit ZIP code';
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(child: SizedBox()), // keeps two-column layout alignment
      ],
    );
  }
}
