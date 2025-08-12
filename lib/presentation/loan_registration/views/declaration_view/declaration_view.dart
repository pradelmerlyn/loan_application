import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/declaration_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/views/declaration_view/declaration_view_info.dart';

class DeclarationView extends StatelessWidget {
  final DeclarationInfoFormControllers controllers;
  final GlobalKey<FormState> formKey;

  const DeclarationView({
    super.key,
    required this.controllers,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(children: [DeclarationInfoSection(ctrls: controllers)]),
      ),
    );
  }
}
