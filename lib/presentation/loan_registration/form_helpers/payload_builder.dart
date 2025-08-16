import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_helpers/borrower_payload_builder.dart';

/// Keep this builder PURE. Pass IDs in — don't reach into GetIt/Bloc here.
LoanRegistrationEntity buildLoanRegistrationEntityFromControllers({
  required BorrowerInfoFormControllers borrowerCtrls,
  required PropertyInfoFormControllers propertyCtrls,
  required AssetFormControllers financialCtrl,

  
  int? id,
  int? loanNumber, 
  String? borrowerId,
}) {
  // Build the borrower from the form
  final borrowerFromForm = buildBorrowerFromForm(borrowerCtrls);

  // Rebuild borrower with injected ID 
  final borrowerWithId = BorrowerEntity(
    id: borrowerId,
    firstName: borrowerFromForm.firstName,
    middleName: borrowerFromForm.middleName,
    lastName: borrowerFromForm.lastName,
    suffixName: borrowerFromForm.suffixName,
    dateOfBirth: borrowerFromForm.dateOfBirth,
    taxIdentifier: borrowerFromForm.taxIdentifier,
    emailAddress: borrowerFromForm.emailAddress,
    phoneNumbers: borrowerFromForm.phoneNumbers,
    maritalStatus: borrowerFromForm.maritalStatus,
    dependentAges: borrowerFromForm.dependentAges,
    spouseIsCoBorrowerIndicator: borrowerFromForm.spouseIsCoBorrowerIndicator,
    spouseEligibleForVABenefits: borrowerFromForm.spouseEligibleForVABenefits,
    militaryServiceExpectedCompletionDate:
        borrowerFromForm.militaryServiceExpectedCompletionDate,
    militaryStatusType: borrowerFromForm.militaryStatusType,
    currentAddress: borrowerFromForm.currentAddress,
    addresses: borrowerFromForm.addresses,
    isMailingAddressSameAsCurrent:
        borrowerFromForm.isMailingAddressSameAsCurrent,
    mailingAddress: borrowerFromForm.mailingAddress,
    incomes: borrowerFromForm.incomes,
    intentToOccupy: borrowerFromForm.intentToOccupy,
    homeownerPastThreeYears: borrowerFromForm.homeownerPastThreeYears,
    priorPropertyUsageType: borrowerFromForm.priorPropertyUsageType,
    priorPropertyTitleType: borrowerFromForm.priorPropertyTitleType,
    specialBorrowerSellerRelationshipIndicator:
        borrowerFromForm.specialBorrowerSellerRelationshipIndicator,
    undisclosedBorrowedFundsIndicator:
        borrowerFromForm.undisclosedBorrowedFundsIndicator,
    undisclosedBorrowedFundsAmount:
        borrowerFromForm.undisclosedBorrowedFundsAmount,
    undisclosedMortgageApplicationIndicator:
        borrowerFromForm.undisclosedMortgageApplicationIndicator,
    undisclosedCreditApplicationIndicator:
        borrowerFromForm.undisclosedCreditApplicationIndicator,
    propertySubjectToPriorityLienIndicator:
        borrowerFromForm.propertySubjectToPriorityLienIndicator,
    undisclosedComakerOfNoteIndicator:
        borrowerFromForm.undisclosedComakerOfNoteIndicator,
    outstandingJudgmentsIndicator:
        borrowerFromForm.outstandingJudgmentsIndicator,
    partyToLawsuitIndicator: borrowerFromForm.partyToLawsuitIndicator,
    presentlyDelinquentIndicator: borrowerFromForm.presentlyDelinquentIndicator,
    priorPropertyDeedInLieuConveyedIndicator:
        borrowerFromForm.priorPropertyDeedInLieuConveyedIndicator,
    deedInLieuLatestCompletionDate:
        borrowerFromForm.deedInLieuLatestCompletionDate,
    priorPropertyShortSaleCompletedIndicator:
        borrowerFromForm.priorPropertyShortSaleCompletedIndicator,
    shortSaleLatestCompletionDate:
        borrowerFromForm.shortSaleLatestCompletionDate,
    priorPropertyForeclosureCompletedIndicator:
        borrowerFromForm.priorPropertyForeclosureCompletedIndicator,
    foreclosureLatestCompletionDate:
        borrowerFromForm.foreclosureLatestCompletionDate,
    bankruptcyIndicator: borrowerFromForm.bankruptcyIndicator,
    bankruptcies: borrowerFromForm.bankruptcies,
    hmdaGenderDetails: borrowerFromForm.hmdaGenderDetails,
    hmdaEthnicityDetails: borrowerFromForm.hmdaEthnicityDetails,
    hmdaRaceDetails: borrowerFromForm.hmdaRaceDetails,
    action: borrowerFromForm.action,
    currentTotalMonthlyHousingExpense:
        borrowerFromForm.currentTotalMonthlyHousingExpense,
    livedMoreThanTwoYears: borrowerFromForm.livedMoreThanTwoYears,
  );

  return LoanRegistrationEntity(
    applicationId: id, 
    id: id, 
    loanNumber: loanNumber,
    loanOfficerId: 'mmaine',
    loanPurpose: 'Purchase',
    loanAmount: 0,
    borrower: borrowerWithId,
    subjectPropertyFoundIndicator: true,
  );
}
