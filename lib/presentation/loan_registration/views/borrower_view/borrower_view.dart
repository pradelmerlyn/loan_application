import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_contact_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_current_address_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_mailing_address_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_military_service_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_monthly_expense_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_personal_info_view.dart';
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_previous_address_info_view.dart';

class BorrowerView extends StatelessWidget {
  final BorrowerInfoFormControllers controllers;
  final GlobalKey<FormState> formKey;

  const BorrowerView({
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
            PersonalInfoSection(borrControllers: controllers),
            MilitaryServiceInfoSection(borrControllers: controllers),
            ContactInfoSection(borrControllers: controllers),
            CurrentAddressSection(borrControllers: controllers),
            PreviousAddressSection(borrControllers: controllers),
            MailingAddressSection(borrControllers: controllers),
            MonthlyHousingExpensesSection(borrControllers: controllers),
          ],
        ),
      ),
    );
  }
}
