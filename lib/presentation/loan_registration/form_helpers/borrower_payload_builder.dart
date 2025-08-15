import 'package:loan/domain/entities/borrower/borrower_bankruptcy/borrower_bankruptcy_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_current_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_home_phone_number_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_previous_addresses_entity.dart';
import 'package:loan/presentation/assets/form_controllers/asset_item_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/declaration_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/demographic_info_form_controller.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';

BorrowerEntity buildBorrowerFromForm(
  BorrowerInfoFormControllers borrCtrls, [
  PropertyInfoFormControllers? propCtrls,
  AssetFormControllers? financialCtrl,
  DeclarationInfoFormControllers? declarationCtrls,
  DemographicsFormControllers? demographicsCtrls,
]) {
  const v = FormValidators.i;

  // DOB
  DateTime? dob;
  final rawDob = borrCtrls.bdayCtrl.text.trim();
  if (rawDob.isNotEmpty) {
    dob = DateTime.tryParse(rawDob);
  }

  // Military exp. term
  DateTime? expirationTerm;
  final rawExpTerm = borrCtrls.expirationTermCtrl.text.trim();
  if (rawExpTerm.isNotEmpty) {
    expirationTerm = DateTime.tryParse(rawExpTerm);
  }

  return BorrowerEntity(
    // Basic info
    firstName: borrCtrls.firstNameCtrl.text.trim(),
    middleName: borrCtrls.middleNameCtrl.text.trim(),
    lastName: borrCtrls.lastNameCtrl.text.trim(),
    suffixName: borrCtrls.suffixCtrl.text.trim(),
    dateOfBirth: dob,
    maritalStatus: borrCtrls.maritalStatusCtrl.text.trim(),
    emailAddress: borrCtrls.emailCtrl.text.trim(),
    taxIdentifier: borrCtrls.ssnCtrl.text.trim(),

    // Booleans from text controllers
    isMailingAddressSameAsCurrent: v.boolFromTextCtrl(
      borrCtrls.isSameAsCurrentCtrl,
      fallback: false,
    ),
    spouseEligibleForVABenefits: v.boolFromTextCtrl(
      borrCtrls.isVABorrowingCtrl,
      fallback: false,
    ),
    spouseIsCoBorrowerIndicator: false,

    // Military
    militaryStatusType: borrCtrls.militaryServiceTypeCtrl.text.trim(),
    militaryServiceExpectedCompletionDate: expirationTerm,

    // Dependents
    dependentAges: borrCtrls.dependentAgeCtrl.text.isEmpty
        ? <int>[]
        : <int>[int.tryParse(borrCtrls.dependentAgeCtrl.text) ?? 0],

    // Phones
    phoneNumbers: <BorrowerHomePhoneNumberEntity>[
      BorrowerHomePhoneNumberEntity(
        number: v.formatPhone(borrCtrls.phoneCtrl.text),
        type: 'Home', // if API expects enum/int, convert here
      ),
    ],

    // Current address
    currentAddress: BorrowerCurrentAddressEntity(
      line: borrCtrls.addressLine1Ctrl.text.trim(),
      line2: borrCtrls.unitNoCtrl.text.trim().isEmpty
          ? null
          : borrCtrls.unitNoCtrl.text.trim(),
      city: borrCtrls.cityCtrl.text.trim(),
      state: borrCtrls.stateCtrl.text.trim(),
      zipCode: borrCtrls.zipCodeCtrl.text.trim(),
    ),

    // Previous addresses
    addresses: [
      BorrowerPreviousAddressesEntity(
        line: borrCtrls.prevAddressLine1Ctrl.text.trim(),
        line2: borrCtrls.prevUnitNoCtrl.text.trim(),
        city: borrCtrls.prevCityCtrl.text.trim(),
        state: borrCtrls.prevStateCtrl.text.trim(),
        zipCode: borrCtrls.prevZipCodeCtrl.text.trim(),
        addressValidStart: v.dateFromTextCtrl(borrCtrls.startDateCtrl),
      ),
    ],
    // Typed empty lists to avoid List<dynamic>
    incomes: const <BorrowerIncomeEntity>[],
    bankruptcies: const <BorrowerBankruptcyEntity>[], // replace with correct entity if you have one

    // HMDA
    hmdaGenderDetails: null, // BorrowerHmdaGenderDetailsEntity?
    hmdaEthnicityDetails: null,
    hmdaRaceDetails: null, // BorrowerHmdaRaceDetailsEntity?

    // Other fields
    currentTotalMonthlyHousingExpense:
        double.tryParse(borrCtrls.totalHousingExpenseCtrl.text) ?? 0,
  );
}

/// Build the full payload (for final SUBMIT)
// LoanRegistrationEntity buildFullPayload({
//   required BorrowerInfoFormControllers borrowerCtrls,
//   required PropertyInfoFormControllers propertyCtrls,
//   required AssetFormControllers financialCtrl,
// }) {
//   final borrower = buildBorrowerFromForm(borrowerCtrls);

//   final subjectProperty = PropertyEntity(
//     intendedUsageType: propertyCtrls.intendedUsageType.text.trim(),
//     propertyType: propertyCtrls.propertyType.text.trim(),
//     address: PropertyAddressEntity(
//       line: propertyCtrls.propAddressLine1Ctrl.text.trim(),
//       line2: propertyCtrls.propUnitNoCtrl.text.trim(),
//       city: propertyCtrls.propCityCtrl.text.trim(),
//       state: propertyCtrls.propStateCtrl.text.trim(),
//       zipCode: propertyCtrls.propZipCodeCtrl.text.trim(),
//       action: 'Add',
//     ),
//   );

//   final assets = financialCtrl.rows
//       .map(
//         (row) => AssetEntity(
//           assetType: row.assetTypeCtrl.text.trim(),
//           institutionName: row.financialInstitutionNameCtrl.text.trim(),
//           accountIdentifier: row.accountNumberCtrl.text.trim(),
//           assetValue: double.tryParse(row.cashMarketValueCtrl.text.trim()) ?? 0,
//           userType: 'Borrower',
//           action: 'Add',
//         ),
//       )
//       .toList();

//   return LoanRegistrationEntity(
//     loanOfficerId: 'mmaine',
//     loanPurpose: 'Purchase',
//     borrower: borrower,
//     subjectPropertyFoundIndicator: true,
//     subjectProperty: subjectProperty,

//   );
//}
