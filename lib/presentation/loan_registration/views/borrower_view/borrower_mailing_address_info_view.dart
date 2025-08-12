import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan/presentation/loan_registration/validators/borrower_view_validators.dart';

import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/toggle_switch.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';

class MailingAddressSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;
  const MailingAddressSection({super.key, required this.borrControllers});

  void _copyCurrentAddress(bool same) {
    if (!same) return;
    borrControllers.mailAddressLine1Ctrl.text =
        borrControllers.addressLine1Ctrl.text;
    borrControllers.mailUnitNoCtrl.text = borrControllers.unitNoCtrl.text;
    borrControllers.mailCityCtrl.text = borrControllers.cityCtrl.text;
    borrControllers.mailStateCtrl.text = borrControllers.stateCtrl.text;
    borrControllers.mailZipCodeCtrl.text = borrControllers.zipCodeCtrl.text;
  }

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: borrControllers.isSameAsCurrentCtrl,
        builder: (context, v, _) {
          final same = borrValidator.asBool(v.text);
          _copyCurrentAddress(same);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(label: 'Mailing Address'),
              const SizedBox(height: 12),
              ToggleSwitchField(
                label: "Mailing address is same as the current address?",
                controller: borrControllers.isSameAsCurrentCtrl,
                trueLabel: 'YES',
                falseLabel: 'NO',
                storeAsYesNo: true,
                onChanged: (val) {
                  _copyCurrentAddress(val);
                },
              ),

              _MailAddressLine1Field(
                ctrl: borrControllers.mailAddressLine1Ctrl,
                readOnly: same,
              ),
              _MailUnitAndCityRow(
                unitCtrl: borrControllers.mailUnitNoCtrl,
                cityCtrl: borrControllers.mailCityCtrl,
                readOnly: same,
              ),
              _MailStateAndZipRow(
                stateCtrl: borrControllers.mailStateCtrl,
                zipCtrl: borrControllers.mailZipCodeCtrl,
                disabled: same,
              ),
            ],
          );
        },
      ),
    );
  }
}

/* -------------------- Fields -------------------- */

class _MailAddressLine1Field extends StatelessWidget {
  final TextEditingController ctrl;
  final bool readOnly;
  const _MailAddressLine1Field({required this.ctrl, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 16),
        FormTextField(
          label: 'Address Line 1',
          controller: ctrl,
          readOnly: readOnly,
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Address Line 1'),
        ),
      ],
    );
  }
}

class _MailUnitAndCityRow extends StatelessWidget {
  final TextEditingController unitCtrl;
  final TextEditingController cityCtrl;
  final bool readOnly;
  const _MailUnitAndCityRow({
    required this.unitCtrl,
    required this.cityCtrl,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              label: 'Apt/Unit/Suite',
              controller: unitCtrl,
              readOnly: readOnly,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'Apt/Unit/Suite'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'City',
              controller: cityCtrl,
              readOnly: readOnly,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'City'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MailStateAndZipRow extends StatelessWidget {
  final TextEditingController stateCtrl;
  final TextEditingController zipCtrl;
  final bool disabled;
  const _MailStateAndZipRow({
    required this.stateCtrl,
    required this.zipCtrl,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
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
              // disable by passing null onChanged
              onChanged: disabled ? null : (v) => stateCtrl.text = v ?? '',
              validator: (v) =>
                  (v == null || v.isEmpty) ? "State is required" : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FormTextField(
              label: 'Zip Code',
              controller: zipCtrl,
              readOnly: disabled,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) => borrValidator.zip(value, field: 'Zip Code'),
            ),
          ),
        ],
      ),
    );
  }
}
