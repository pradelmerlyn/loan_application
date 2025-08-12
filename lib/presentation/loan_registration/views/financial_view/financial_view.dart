import 'package:flutter/material.dart';
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';
import 'package:loan/presentation/loan_registration/views/financial_view/addtional_income_view/additional_income_view.dart';
import 'package:loan/presentation/loan_registration/views/financial_view/asset_view/asset_info_view.dart';
import 'package:loan/presentation/loan_registration/views/financial_view/employment_view/employment_view.dart';

class FinancialView extends StatelessWidget {
  final AssetFormControllers controllers;
  final GlobalKey<FormState> formKey;

  const FinancialView({
    super.key,
    required this.controllers,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        AssetsSection(),
        SizedBox(height: 16),
        EmploymentSection(),
        SizedBox(height: 16),
        AdditionalIncomeSection(),
      ],
    );
  }
}
