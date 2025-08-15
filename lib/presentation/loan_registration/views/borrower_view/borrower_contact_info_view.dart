import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';

class ContactInfoSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;
  const ContactInfoSection({super.key, required this.borrControllers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Contact Information'),
          _PhoneNumberField(ctrl: borrControllers.phoneCtrl),
          _EmailAddressField(ctrl: borrControllers.emailCtrl),
        ],
      ),
    );
  }
}

//** ------- FIELDS ------** /

class _PhoneNumberField extends StatelessWidget {
  final TextEditingController ctrl;
  const _PhoneNumberField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;

    return Column(
      children: [
        const SizedBox(height: 20),
        FormTextField(
          label: 'Phone Number',
          controller: ctrl,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          validator: borrValidator.validatePhone,
          onSaved: (v) {
            ctrl.text = borrValidator.formatPhone(v);
          },
        ),
      ],
    );
  }
}

class _EmailAddressField extends StatelessWidget {
  final TextEditingController ctrl;
  const _EmailAddressField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return Column(
      children: [
        const SizedBox(height: 20),
        FormTextField(
          label: 'Email Address',
          controller: ctrl,
          keyboardType: TextInputType.emailAddress,
          validator: borrValidator.email,
        ),
      ],
    );
  }
}
