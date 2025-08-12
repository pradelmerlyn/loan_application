import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/demographic_info_form_controller.dart';
import 'package:loan/presentation/loan_registration/views/demographics_view/demographic_info_view.dart';

class DemographicView extends StatelessWidget {
  final DemographicsFormControllers controllers;
  final GlobalKey<FormState> formKey;

  const DemographicView({
    super.key,
    required this.controllers,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(children: [DemographicsSection(ctrls: controllers)]),
      ),
    );
  }
}
