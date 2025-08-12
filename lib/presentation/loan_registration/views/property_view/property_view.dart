import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/views/property_view/property_address_info_view.dart';
import 'package:loan/presentation/loan_registration/views/property_view/property_info_view.dart';

class PropertyView extends StatelessWidget {
  final PropertyInfoFormControllers controllers;
  final GlobalKey<FormState> formKey;

  const PropertyView({
    super.key,
    required this.controllers,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            PropertyInfoSection(ctrls: controllers),
            PropertyAddressSection(ctrls: controllers),
          ],
        ),
      ),
    );
  }
}
