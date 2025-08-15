import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';

class CurrentAddressSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;
  const CurrentAddressSection({super.key, required this.borrControllers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Current Address'),

          _HousingStatusField(ctrl: borrControllers.homeStatusCrtl),
          _MonthlyRentField(ctrl: borrControllers.monthlyRentCtrl),
          _StartDateField(ctrl: borrControllers.startDateCtrl),
          const SizedBox(height: 8), // divider gap like your mock

          _OccupancyTypeField(ctrl: borrControllers.occupancyTypeCtrl),
          _AddressLine1Field(ctrl: borrControllers.addressLine1Ctrl),
          _UnitAndCityRow(
            unitCtrl: borrControllers.unitNoCtrl,
            cityCtrl: borrControllers.cityCtrl,
          ),
          _StateAndZipRow(
            stateCtrl: borrControllers.stateCtrl,
            zipCtrl: borrControllers.zipCodeCtrl,
          ),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _HousingStatusField extends StatelessWidget {
  final TextEditingController ctrl;
  const _HousingStatusField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        DropDownField(
          label: "Housing Status",
          value: ctrl.text.isEmpty ? null : ctrl.text,
          items: const [
            DropdownMenuItem(value: "Own", child: Text("Own")),
            DropdownMenuItem(value: "Rent", child: Text("Rent")),
            DropdownMenuItem(
              value: "Live with Family",
              child: Text("Live with Family"),
            ),
            DropdownMenuItem(value: "Other", child: Text("Other")),
          ],
          onChanged: (v) => ctrl.text = v ?? '',
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Housing Status'),
        ),
      ],
    );
  }
}

class _MonthlyRentField extends StatelessWidget {
  final TextEditingController ctrl;
  const _MonthlyRentField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'Monthly Rent',
          controller: ctrl,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9,.\$]')),
          ],
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Monthly Rent'),
        ),
      ],
    );
  }
}

class _StartDateField extends StatelessWidget {
  final TextEditingController ctrl;
  const _StartDateField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'Start Date',
          controller: ctrl,
          readOnly: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today_rounded),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now().subtract(const Duration(days: 30)),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                ctrl.text =
                    '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
              }
            },
          ),
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Start Date'),
        ),
      ],
    );
  }
}

class _OccupancyTypeField extends StatelessWidget {
  final TextEditingController ctrl;
  const _OccupancyTypeField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        DropDownField(
          label: "Occupancy Type",
          value: ctrl.text.isEmpty ? null : ctrl.text,
          items: const [
            DropdownMenuItem(
              value: "Primary Residence",
              child: Text("Primary Residence"),
            ),
            DropdownMenuItem(value: "Second Home", child: Text("Second Home")),
            DropdownMenuItem(value: "Investment", child: Text("Investment")),
            DropdownMenuItem(value: "Rent", child: Text("Rent")),
          ],
          onChanged: (v) => ctrl.text = v ?? '',
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Occupancy Type'),
        ),
      ],
    );
  }
}

class _AddressLine1Field extends StatelessWidget {
  final TextEditingController ctrl;
  const _AddressLine1Field({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
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

class _UnitAndCityRow extends StatelessWidget {
  final TextEditingController unitCtrl;
  final TextEditingController cityCtrl;
  const _UnitAndCityRow({required this.unitCtrl, required this.cityCtrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(label: 'Apt/Unit/Suite', controller: unitCtrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'City',
              controller: cityCtrl,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'Apt/Unit/Suite'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StateAndZipRow extends StatelessWidget {
  final TextEditingController stateCtrl;
  final TextEditingController zipCtrl;
  const _StateAndZipRow({required this.stateCtrl, required this.zipCtrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: DropDownField(
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
