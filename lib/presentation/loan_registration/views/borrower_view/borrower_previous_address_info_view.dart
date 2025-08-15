import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';

import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';

class PreviousAddressSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;
  const PreviousAddressSection({super.key, required this.borrControllers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Previous Address'),
          _PrevAddressLine1Field(ctrl: borrControllers.prevAddressLine1Ctrl),
          _PrevUnitAndCityRow(
            unitCtrl: borrControllers.prevUnitNoCtrl,
            cityCtrl: borrControllers.prevCityCtrl,
          ),
          _PrevStateAndZipRow(
            stateCtrl: borrControllers.prevStateCtrl,
            zipCtrl: borrControllers.prevZipCodeCtrl,
          ),
          _PrevStartAndEndDatesRow(
            startCtrl: borrControllers.prevStartDateCtrl,
            endCtrl: borrControllers.prevEndDateCtrl,
          ),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _PrevAddressLine1Field extends StatelessWidget {
  final TextEditingController ctrl;
  const _PrevAddressLine1Field({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 16),
        FormTextField(
          label: 'Address Line 1',
          controller: ctrl,
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Address Line 1'),
        ),
      ],
    );
  }
}

class _PrevUnitAndCityRow extends StatelessWidget {
  final TextEditingController unitCtrl;
  final TextEditingController cityCtrl;
  const _PrevUnitAndCityRow({required this.unitCtrl, required this.cityCtrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              label: 'Apt/Unit/Suite',
              controller: unitCtrl,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'Apt/Unit/Suite'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'City',
              controller: cityCtrl,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'City'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrevStateAndZipRow extends StatelessWidget {
  final TextEditingController stateCtrl;
  final TextEditingController zipCtrl;
  const _PrevStateAndZipRow({required this.stateCtrl, required this.zipCtrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: DropDownField<String>(
              label: "State",
              value: stateCtrl.text.isEmpty ? null : stateCtrl.text,
              items: const [
                DropdownMenuItem(
                  value: "California",
                  child: Text("California"),
                ),
                DropdownMenuItem(value: "Arizona", child: Text("Arizona")),
                DropdownMenuItem(value: "Nevada", child: Text("Nevada")),
                DropdownMenuItem(value: "Texas", child: Text("Texas")),
              ],
              onChanged: (v) => stateCtrl.text = v ?? '',
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'State'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'Zip Code',
              controller: zipCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              validator: (value) => borrValidator.zip(value, field: 'Zip Code'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrevStartAndEndDatesRow extends StatelessWidget {
  final TextEditingController startCtrl;
  final TextEditingController endCtrl;
  const _PrevStartAndEndDatesRow({
    required this.startCtrl,
    required this.endCtrl,
  });

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController ctrl,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      ctrl.text =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              label: 'Start Date',
              controller: startCtrl,
              readOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: () => _pickDate(context, startCtrl),
              ),
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'Start Date'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'End Date',
              controller: endCtrl,
              readOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: () => _pickDate(context, endCtrl),
              ),
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'End Date'),
            ),
          ),
        ],
      ),
    );
  }
}
