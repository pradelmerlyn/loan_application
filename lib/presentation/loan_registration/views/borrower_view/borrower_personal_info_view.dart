import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan/presentation/loan_registration/bloc/borrower_view/borrower_view_bloc.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/validators/borrower_view_validators.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/multivalue_input_field.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';

class PersonalInfoSection extends StatefulWidget {
  final BorrowerInfoFormControllers borrControllers;

  const PersonalInfoSection({super.key, required this.borrControllers});

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  BorrowerViewBloc? _bloc;
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _bloc ??= context.read<BorrowerViewBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Personal Information'),
          // SSN
          _SSNField(ctrl: widget.borrControllers.ssnCtrl),
          _FirstNameField(ctrl: widget.borrControllers.firstNameCtrl),
          _MiddleNameField(ctrl: widget.borrControllers.middleNameCtrl),

          _LastNameSuffixField(
            lastNameCtrl: widget.borrControllers.lastNameCtrl,
            suffixCtrl: widget.borrControllers.suffixCtrl,
          ),
          _DateOfBirthField(ctrl: widget.borrControllers.bdayCtrl),
          _MaritalStatusField(ctrl: widget.borrControllers.maritalStatusCtrl),
          _CitizenShipField(ctrl: widget.borrControllers.citizenshipCtrl),
          _DependentAgesField(ctrl: widget.borrControllers.dependentAgeCtrl),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /
class _SSNField extends StatelessWidget {
  final TextEditingController ctrl;
  const _SSNField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const v = BorrowerViewValidators.i; // your singleton helper

    return BlocBuilder<BorrowerViewBloc, BorrowerViewState>(
      // we can rebuild on any change; it's cheap
      builder: (context, state) {
        // Build the string we WANT to see in the field
        final display = v.ssnDisplay(state.ssn, obscure: state.obscureSSN);

        // Update the controller text safely after build to avoid rebuild errors
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (ctrl.text != display) {
            ctrl.value = ctrl.value.copyWith(
              text: display,
              selection: TextSelection.collapsed(offset: display.length),
              composing: TextRange.empty,
            );
          }
        });

        return Column(
          children: [
            const SizedBox(height: 15),
            FormTextField(
              label: 'Social Security Number',
              controller: ctrl,
              // IMPORTANT: don't use obscureText; we render masked text ourselves
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(9),
              ],
              // Send raw digits (user typing) to bloc
              onChanged: (raw) =>
                  context.read<BorrowerViewBloc>().add(SsnEdited(raw)),
              suffixIcon: IconButton(
                icon: Icon(
                  // eye with slash when masked, normal eye when showing full
                  state.obscureSSN ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () =>
                    context.read<BorrowerViewBloc>().add(const ToggleSSN()),
              ),
              validator: (value) =>
                  v.requiredField(value, field: 'Social Security Number'),
            ),
          ],
        );
      },
    );
  }
}

class _FirstNameField extends StatelessWidget {
  final TextEditingController ctrl;
  const _FirstNameField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'First Name',
          controller: ctrl,
          validator: (value) =>
              borrValidator.requiredField(value, field: 'First Name'),
        ),
      ],
    );
  }
}

class _MiddleNameField extends StatelessWidget {
  final TextEditingController ctrl;
  const _MiddleNameField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'Middle Name',
          controller: ctrl,
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Middle Name'),
        ),
      ],
    );
  }
}

class _LastNameSuffixField extends StatelessWidget {
  final TextEditingController lastNameCtrl;
  final TextEditingController suffixCtrl;
  const _LastNameSuffixField({
    required this.lastNameCtrl,
    required this.suffixCtrl,
  });

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              label: 'Last Name',
              controller: lastNameCtrl,
              validator: (value) =>
                  borrValidator.requiredField(value, field: 'Last Name'),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 110,
            child: FormTextField(label: 'Suffix', controller: suffixCtrl),
          ),
        ],
      ),
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  final TextEditingController ctrl;
  const _DateOfBirthField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        FormTextField(
          label: 'Date of Birth',
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
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Date of Birth'),
        ),
      ],
    );
  }
}

class _MaritalStatusField extends StatefulWidget {
  final TextEditingController ctrl;
  const _MaritalStatusField({required this.ctrl});

  @override
  State<_MaritalStatusField> createState() => _MaritalStatusFieldState();
}

class _MaritalStatusFieldState extends State<_MaritalStatusField> {
  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        DropDownField(
          label: "Marital Status",
          value: widget.ctrl.text.isEmpty ? null : widget.ctrl.text,
          items: const [
            DropdownMenuItem(value: "Single", child: Text("Single")),
            DropdownMenuItem(value: "Married", child: Text("Married")),
            DropdownMenuItem(value: "Divorced", child: Text("Divorced")),
            DropdownMenuItem(value: "Widowed", child: Text("Widowed")),
          ],
          onChanged: (value) {
            setState(() {
              widget.ctrl.text = value ?? '';
            });
          },
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Marital Status'),
        ),
      ],
    );
  }
}

class _CitizenShipField extends StatefulWidget {
  final TextEditingController ctrl;
  const _CitizenShipField({required this.ctrl});

  @override
  State<_CitizenShipField> createState() => _CitizenShipFieldState();
}

class _CitizenShipFieldState extends State<_CitizenShipField> {
  @override
  Widget build(BuildContext context) {
    const borrValidator = BorrowerViewValidators.i;
    return Column(
      children: [
        const SizedBox(height: 15),
        DropDownField(
          label: "What is your citrizenship status?",
          value: widget.ctrl.text.isEmpty ? null : widget.ctrl.text,
          items: const [
            DropdownMenuItem(value: "U.S Citizen", child: Text("U.S Citizen")),
            DropdownMenuItem(
              value: "Permanent Resident",
              child: Text("Permanent Resident"),
            ),
            DropdownMenuItem(
              value: "Non-Permanent Resident",
              child: Text("Non-Permanent Resident"),
            ),
            DropdownMenuItem(
              value: "Foreign National",
              child: Text("Foreign National"),
            ),
            DropdownMenuItem(value: "Other", child: Text("Other")),
          ],
          onChanged: (value) {
            setState(() {
              widget.ctrl.text = value ?? '';
            });
          },
          validator: (value) =>
              borrValidator.requiredField(value, field: 'Citizenship Status'),
        ),
      ],
    );
  }
}

class _DependentAgesField extends StatelessWidget {
  final TextEditingController ctrl;
  const _DependentAgesField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        MultiValueInputField(
          label: "Dependent Ages",
          controller: ctrl,
          validator: (values) {
            if (values == null || values.isEmpty) {
              return "Please enter at least one age";
            }
            final nonNumeric = values
                .where((v) => int.tryParse(v) == null)
                .toList();
            if (nonNumeric.isNotEmpty) return "Ages must be numbers";
            return null;
          },
          onChanged: (vals) {
            // vals e.g. ['12','15','18']
          },
        ),
      ],
    );
  }
}

//** END Personal Info Field ** /
