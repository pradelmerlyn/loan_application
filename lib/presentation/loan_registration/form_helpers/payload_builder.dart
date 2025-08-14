import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_helpers/borrower_payload_builder.dart';

LoanRegistrationEntity buildLoanRegistrationEntityFromControllers({
  required BorrowerInfoFormControllers borrowerCtrls,
  required PropertyInfoFormControllers propertyCtrls,
  required AssetFormControllers financialCtrl,
}) {
  final borrower = buildBorrowerFromForm(borrowerCtrls);

  return LoanRegistrationEntity(
    loanOfficerId: 'mmaine',
    loanPurpose: 'Purchase',
    loanAmount: 0,
    borrower: borrower,
    subjectPropertyFoundIndicator: true,
  );
}
