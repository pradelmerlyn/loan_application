
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
    incomes: const [],
    bankruptcies: const [], 
    // HMDA
    hmdaGenderDetails: null, // BorrowerHmdaGenderDetailsEntity?
    hmdaEthnicityDetails: null,
    hmdaRaceDetails: null, // BorrowerHmdaRaceDetailsEntity?

    // Other fields
    currentTotalMonthlyHousingExpense:
        double.tryParse(borrCtrls.totalHousingExpenseCtrl.text) ?? 0,
  );
}

