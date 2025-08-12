import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/validators/borrower_view_validators.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/toggle_switch.dart';

class MilitaryServiceInfoSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;

  const MilitaryServiceInfoSection({super.key, required this.borrControllers});
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Military Service Information'),
          // SSN
          _MilitaryServiceTypeField(
            ctrl: borrControllers.militaryServiceTypeCtrl,
          ),
          _ExpirationTermServiceField(ctrl: borrControllers.expirationTermCtrl),
          _VASurvivingSpouseField(ctrl: borrControllers.isVABorrowingCtrl),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _MilitaryServiceTypeField extends StatefulWidget {
  final TextEditingController ctrl;
  const _MilitaryServiceTypeField({required this.ctrl});

  @override
  State<_MilitaryServiceTypeField> createState() =>
      _MilitaryServiceTypeFieldState();
}

class _MilitaryServiceTypeFieldState extends State<_MilitaryServiceTypeField> {
  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        DropDownField(
          label: "Military Service Type",
          value: widget.ctrl.text.isEmpty ? null : widget.ctrl.text,
          items: const [
            DropdownMenuItem(value: "None", child: Text("None")),
            DropdownMenuItem(value: "Active Duty", child: Text("Active Duty")),
            DropdownMenuItem(value: "Reserve", child: Text("Reserve")),
            DropdownMenuItem(
              value: "National Guard",
              child: Text("National Guard"),
            ),
            DropdownMenuItem(value: "Veteran", child: Text("Veteran")),
            DropdownMenuItem(
              value: "Retired Military",
              child: Text("Retired Military"),
            ),
            DropdownMenuItem(
              value: "Surviving Spouse of Veteran",
              child: Text("Surviving Spouse of Veteran"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              widget.ctrl.text = value ?? '';
            });
          },
          validator: (value) => borrValidator.requiredField(
            value,
            field: 'Military Service Type',
          ),
        ),
      ],
    );
  }
}

class _ExpirationTermServiceField extends StatelessWidget {
  final TextEditingController ctrl;
  const _ExpirationTermServiceField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'Expiration of term of service',
          controller: ctrl,
          readOnly: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today_rounded),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime(1990, 1, 1),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                ctrl.text = '${picked.month}/${picked.day}/${picked.year}';
              }
            },
          ),
          validator: (value) => borrValidator.requiredField(
            value,
            field: 'Expiration of term of service',
          ),
        ),
      ],
    );
  }
}

class _VASurvivingSpouseField extends StatelessWidget {
  final TextEditingController ctrl;

  const _VASurvivingSpouseField({required this.ctrl});
  @override
  Widget build(BuildContext context) {
    //final borrValidator = BorrowerViewValidators();
    return Column(
      children: [
        const SizedBox(height: 15),
        ToggleSwitchField(
          label: "Is the borrower using VA surviving spouse benefits?",
          controller: ctrl,
          trueLabel: 'YES',
          falseLabel: 'NO',
          storeAsYesNo: true,
          onChanged: (v) {
            // do something if needed
            // isVABenefitsCtrl.text is now "YES" or "NO"
          },
          validator: (v) => v ? null : null,
        ),
      ],
    );
  }
}
